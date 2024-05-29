import 'package:flutter/material.dart';
void main() { runApp(TicTacToeApp()); }
class TicTacToeApp extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return MaterialApp(title: 'Tic Tac Toe',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: TicTacToeScreen(),);} }
class TicTacToeScreen extends StatefulWidget {
  @override _TicTacToeScreenState createState() => _TicTacToeScreenState();}
class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<String> _board = [];String _currentPlayer = 'X';
  bool _gameOver = false; // Initialize _gameOver
  @override void initState() {super.initState();
    _initializeBoard(); }void _initializeBoard() { setState(() {
      _board = List.filled(9, '');});} void _onTileTap(int index) {
    if (!_gameOver && _board[index] == '') { setState(() {
        _board[index] = _currentPlayer;
        if (_checkWinner(_currentPlayer)) {
          _showWinnerDialog(_currentPlayer);
          _gameOver = true;} else if (!_board.contains('')) {
          _showDrawDialog();_gameOver = true;
        } else{_currentPlayer = (_currentPlayer == 'X') ? 'O' : 'X';} });} }
  bool _checkWinner(String player) { // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (_board[i] == player && _board[i + 1] == player && _board[i + 2] == player) {
        return true;} }for (int i = 0; i < 3; i++) {
      if (_board[i] == player && _board[i + 3] == player && _board[i + 6] == player) {
        return true;} }
         if ((_board[0] == player && _board[4] == player && _board[8] == player) ||
        (_board[2] == player && _board[4] == player && _board[6] == player)) {
      return true;} return false; } void _showWinnerDialog(String winner) {
    showDialog(context: context,builder: (BuildContext context) {
        return AlertDialog(title: Text('Winner'),
          content: Text('Player $winner wins!'),
          actions: <Widget>[ElevatedButton(onPressed: () {
                Navigator.of(context).pop();_initializeBoard();
                _gameOver = false;},child: Text('Play Again'),),],);}, ); }
  void _showDrawDialog() { showDialog(
      context: context,builder:(BuildContext context){
        return AlertDialog(title: Text('Draw'),
          content: Text('It\'s a draw!'),
          actions: <Widget>[ElevatedButton(onPressed: () {
                Navigator.of(context).pop();_initializeBoard();
                _gameOver = false;},child: Text('Play Again'),),],);},);}
  @override Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: Text('Tic Tac Toe'),),
      body: GridView.builder(padding: EdgeInsets.all(16.0),
        itemCount:9,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:3,crossAxisSpacing:8.0,mainAxisSpacing:8.0,), itemBuilder: (BuildContext context, int index) {
          return GestureDetector(onTap: () => _onTileTap(index),
            child: Container(color: Colors.blue,
              child: Center(child: Text(_board[index],
                  style: TextStyle(fontSize: 48.0, color: Colors.white),
                ),),),); },),);}}
