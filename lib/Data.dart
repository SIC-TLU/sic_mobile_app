// ignore_for_file: file_names
class PostData {
  final String username;
  final String date;
  final String? title;
  final String caption;
  final List<String> hashtags;
  final List<String> prizes;
  String likes;
  final String comments;
  final String shares;
  final List<String>? imageUrls;
  final String? avatarUrl;
  final String defaultAvatar;
  bool isExpanded;
  bool hasSeeMore;
  bool get hasImages => imageUrls != null && imageUrls!.isNotEmpty;

  PostData({
    required this.username,
    required this.date,
    this.title,
    required this.caption,
    required this.hashtags,
    required this.prizes,
    required this.likes,
    required this.comments,
    required this.shares,
    this.imageUrls,
    required this.avatarUrl,
    required this.defaultAvatar,
    this.isExpanded = false,
    this.hasSeeMore = false,
  });
}

final List<PostData> postDataList = [
  PostData(
    username: 'lovanbang999',
    date: '12 Dec 2024',
    title: '[ ĐẠI GIA ĐÌNH SIC K66 CHÍNH THỨC "LÊN SÓNG"!]',
    caption:
        'Chào mừng các CTV SIC K66 đã chính thức gia nhập Đại gia đình SIC của chúng mình! Hãy cùng nhau tạo những dấu ấn đặc biệt cho 4 năm thành xuân này cùng SIC nhé.\n♥Tiếp theo là tiết mục hồi hộp và được mong chờ nhất trong buổi gặp mặt! Những phần quà siêu "cool" đã tìm được chủ nhân của mình. Xin chúc mừng các bạn may mắn nhất:\nBàn phím\nChuột không dây.',
    hashtags: [],
    prizes: ['Bàn phím', 'Chuột không dây'],
    likes: '100',
    comments: '943',
    shares: '10k',
    defaultAvatar: 'assets/images/avatar_default.png',
    avatarUrl: '',
    imageUrls: [
      'assets/images/SIC/sic1.jpg',
      'assets/images/SIC/sic2.jpg',
      'assets/images/SIC/sic3.jpg',
      'assets/images/SIC/sic4.jpg',
      'assets/images/SIC/sic5.jpg',
      'assets/images/SIC/sic6.jpg',
      'assets/images/SIC/sic7.jpg',
      'assets/images/SIC/sic8.jpg',
      'assets/images/SIC/sic9.jpg',
    ],
    isExpanded: false,
    hasSeeMore: false,
  ),
  PostData(
    username: 'vihongminh',
    date: '13 Dec 2024',
    title: '[ ĐẠI GIA ĐÌNH SIC K66 CHÍNH THỨC "LÊN SÓNG"!]',
    caption:
        'Chào mừng các CTV SIC K66 đã chính thức gia nhập Đại gia đình SIC của chúng mình! Hãy cùng nhau tạo những dấu ấn đặc biệt cho 4 năm thành xuân này cùng SIC nhé.\n♥Tiếp theo là tiết mục hồi hộp và được mong chờ nhất trong buổi gặp mặt! Những phần quà siêu "cool" đã tìm được chủ nhân của mình. Xin chúc mừng các bạn may mắn nhất:\nBàn phím\nChuột không dây.',
    hashtags: [],
    prizes: ['Bàn phím', 'Chuột không dây'],
    likes: '250',
    comments: '1324',
    shares: '2k',
    defaultAvatar: 'assets/images/avatar_default.png',
    avatarUrl: 'assets/images/avatar.png',
    imageUrls: [
      'assets/images/SIC/sic1.jpg',
      'assets/images/SIC/sic2.jpg',
      'assets/images/SIC/sic3.jpg',
      'assets/images/SIC/sic4.jpg',
      'assets/images/SIC/sic5.jpg',
      'assets/images/SIC/sic6.jpg',
      'assets/images/SIC/sic7.jpg',
      'assets/images/SIC/sic8.jpg',
      'assets/images/SIC/sic9.jpg',
    ],
    isExpanded: false,
    hasSeeMore: false,
  ),
];
