class AnnouncementModel {
  final String id;
  final String imgUrl;

  AnnouncementModel({required this.id, required this.imgUrl});
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
   
    result.addAll({'imgUrl': imgUrl});
  

    return result;
  }

  factory   AnnouncementModel.fromMap(
      Map<String, dynamic> map, String documentId) {
    return   AnnouncementModel(
      id: documentId,
     
      imgUrl: map['imgUrl'] ?? '',
     
    );
  }
}

List<AnnouncementModel> dummyAnnouncements = [
  AnnouncementModel(
    id: 'nGYWcQ9oCvVm4Fo762IM',
    imgUrl:
        'https://marketplace.canva.com/EAFMdLQAxDU/1/0/1600w/canva-white-and-gray-modern-real-estate-modern-home-banner-NpQukS8X1oo.jpg',
  ),
  AnnouncementModel(
    id: '3HTsYusFR4J0Nh4R8YAz',
    imgUrl:
        'https://edit.org/photos/img/blog/mbp-template-banner-online-store-free.jpg-840.jpg',
  ),
  AnnouncementModel(
    id: 'yN32PlYnY42zbs1f74OA',
    imgUrl:
        'https://casalsonline.es/wp-content/uploads/2018/12/CASALS-ONLINE-18-DICIEMBRE.png',
  ),
  AnnouncementModel(
    id: 'I3g9PeiEsTjLjQrwI60c',
    imgUrl:
        'https://e0.pxfuel.com/wallpapers/606/84/desktop-wallpaper-ecommerce-website-design-company-noida-e-commerce-banner-design-e-commerce.jpg',
  ),
];