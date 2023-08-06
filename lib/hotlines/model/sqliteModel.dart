class FavItem{
  int? _itemid;
  String? _name;
  String? _content;
  String? _url;
  String? _image;
  String? _phone;
  String? _website;
  String? _facebook;

  FavItem(dynamic obj){
    _itemid = obj['itemid'];
    _name = obj['name'];
    _content = obj['content'];
    _url = obj['url'];
    _image = obj['image'];
    _phone = obj['phone'];
    _website = obj['website'];
    _facebook = obj['facebook'];

  }

  FavItem.fromMap(Map<String,dynamic> data){
    _itemid = data['itemid'];
    _name = data['name'];
    _content = data['content'];
    _url = data['url'];
    _image = data['image'];
    _phone = data['phone'];
    _website = data['website'];
    _facebook = data['facebook'];
  }

  Map<String, dynamic> toMap() => {'itemid' : _itemid , 'name' : _name,"content":_content, "url" : _url ,'image' : _image, 'phone' : _phone, "website" : _website , "facebook" : _facebook };
  int? get itemid => _itemid;
  String? get name => _name;
  String? get content => _content;
  String? get url => _url;
  String? get image => _image;
  String? get phone => _phone;
  String? get website => _website;
  String? get facebook => _facebook;
}