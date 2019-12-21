
class Note{

  int _id;
  String _eWord,_hWord;
  
  Note(this._id, this._eWord, this._hWord);

  int get id => _id;
  String get eWord => _eWord;
  String get hWord => _hWord;
  set eWord(String a){
    _eWord = a;
  }
  set hWord(String a){
    _hWord = a;
  }
  toMap(){
    var map = Map<String, dynamic>();
    if (id!=null){
    map['id'] = _id;
    }
    map['eWord'] = _eWord;
    map['hWord'] = _hWord;
    return map;
  }
   fromMap(Map<String, dynamic> map){
    this._id = map['id'];
    this._eWord =  map['eWord'];
    this._hWord =  map['hWord'];
  }



}