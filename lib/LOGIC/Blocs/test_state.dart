
class TestState {
   String desc = '';
    List<String> testList = [];
    int index ;
  TestState({
    required this.desc,
    required this.index,
    required this.testList
  });

  TestState copyWith({
    String? desc,
    int? index,
    List<String>? testList,
  }){
    return TestState(
      desc: desc ?? this.desc,
      index: index ?? this.index,
      testList: testList ?? this.testList
    );
  }

}