import 'dart:convert';


class usersModel {
  final String id;
  final String name;


  usersModel({
    required this.id,
    required this.name,
   
  });

 usersModelcopyWith({
    String? id,
    String? name,
 
   
  }) {
    return usersModel(
      id: id ?? this.id,
      name: name ?? this.name,

    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});


    return result;
  }

  factory usersModel.fromMap(
      Map<String, dynamic> map, String documentId) {
    return usersModel(
      id: documentId,
      name: map['name'] ?? '',
   
    );
  }
}

List<usersModel> dummyProductts = [

  usersModel(
    id: 'zuHIOlufjUFsacVn48kt',
    name: 'yasmeen',
  
  ),
  usersModel(
    id: 'bHCwRrySeNqDFIRzZKZa',
    name: 'aseel',

  ),
  usersModel(
    id: 'vkvvuIrQM7dGYSXFkkQs',
    name: 'afeef',
 
  ),
  usersModel(
    id: 'a2hSaD88h9OnOd0NGAaK',
    name: 'motaze',

  ),
  usersModel(
    id: 'wWBXvZt0rPPpinXjbzTI',
    name: 'abed',

  ),


];