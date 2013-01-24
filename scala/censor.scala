trait Censor {
  val mapping = prepare(Map(
    "shoot" -> "pucky",
    "darn" -> "beans"))
  def prepare(map: Map[String, String]) =
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
