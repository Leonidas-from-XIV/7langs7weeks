import scala.io._
import scala.actors._
import Actor._

// parse real world HTML
// needs tagsoup in yer classplank
// http://blog.dub.podval.org/2010/08/scala-and-tag-soup.html
import scala.xml.{Elem, XML}
import scala.xml.factory.XMLLoader

import org.ccil.cowan.tagsoup.jaxp.SAXFactoryImpl
object TagSoupXmlLoader {
  private val factory = new SAXFactoryImpl()

  def get(): XMLLoader[Elem] = {
    XML.withSAXParser(factory.newSAXParser())
  }
}

class PageLoader(url: String) {
  val data = Source.fromURL(url, "latin1").mkString
  val xml = TagSoupXmlLoader.get().loadString(data)
  def getPageSize() = data.length
  def getPageLinks() = (xml \\ "a").size
}

val urls = List(
  "http://www.amazon.com",
  "http://www.twitter.com",
  "http://www.google.com",
  "http://www.cnn.com")

def timeMethod(method: () => Unit) = {
  val start = System.nanoTime
  method()
  val end = System.nanoTime
  println("Method took " + (end - start) / 1000000000.0 + " seconds.")
}

def getPagesSequentially() = {
  for (url <- urls) {
    val pl = new PageLoader(url)
    println("Size for %s: %d, %d links".format(url,
      pl.getPageSize, pl.getPageLinks))
  }
}

def getPagesConcurrently() = {
  val caller = self

  for (url <- urls) {
    actor {
      val pl = new PageLoader(url)
      caller ! (url, pl.getPageSize, pl.getPageLinks)
    }
  }

  for (i <- 1 to urls.size) {
    receive {
      case (url, size, links) =>
        println("Size for %s: %d, %d links".format(url, size, links))
    }
  }
}

println("Sequential run:")
timeMethod { getPagesSequentially }

println("Concurrent run:")
timeMethod { getPagesConcurrently }
