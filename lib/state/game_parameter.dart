class GameParameter {
  final int numOfLines;
  final Set<int> positionsOfIsland;
  const GameParameter(
    {
      this.numOfLines = 5,
      this.positionsOfIsland =  const <int>{3, 18},
    }
  );
}