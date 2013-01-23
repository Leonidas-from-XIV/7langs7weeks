class Board(val board: List[List[String]]) {
  def apply(xy: (Int, Int)) = board(xy._1)(xy._2)
}

val coords = List(
  // vertical
  List((0, 0), (0, 1), (0, 2)),
  List((1, 0), (1, 1), (1, 2)),
  List((2, 0), (2, 1), (2, 2)),
  // horizontal
  List((0, 1), (0, 2), (0, 3)),
  List((1, 1), (1, 2), (1, 3)),
  List((2, 1), (2, 2), (2, 3)),
  // diagonal
  List((0, 0), (1, 1), (2, 2)),
  List((2, 0), (1, 1), (0, 2)))

def allsame(b: Board, iter: List[(Int, Int)], element: String) = iter.forall(b(_) == element)

def whowins(b: Board): String = {
  for (candidate: List[(Int, Int)] <- coords) {
    if (allsame(b, candidate, "X")) {
      return "X"
    }
    else if (allsame(b, candidate, "O")) {
      return "O"
    }
  }
  return " "
}

val b = new Board(List(List("X", "O", ""), List("X", "X", "O"), List("O", " ", "X")))
println("Winner is '" + whowins(b) + "'.")
