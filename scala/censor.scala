import scala.util.parsing.json.JSON
import scala.io.Source

trait Censor {
  val src = Source.fromFile("censor.json").mkString
  val loaded = JSON.parseFull(src)
  val parsed = loaded match {
    case Some(e) => e.asInstanceOf[Map[String,String]]
    case None => Map[String,String]()
  }
  val mapping = casePrepare(parsed)

  def casePrepare(map: Map[String, String]) =
    map.foldLeft(map){(res, entry) =>
      val (k, v) = entry
      res + (k.capitalize -> k.capitalize)
    }
  def censor(text: String): String = {
    mapping.foldLeft(text){(res, pair) =>
      val (fuckingmatch, replacement) = pair
      res.replaceAllLiterally(fuckingmatch, replacement)
    }
  }
}

class Movie

class AmericanMovie extends Movie with Censor

val am = new AmericanMovie()
println(am.censor("Pretty darn irresistible. Well, shoot."))
//println(am.mapping)
