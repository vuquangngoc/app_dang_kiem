import 'package:test11/state_model2.dart';

class Repository2 {
  // List<Map> getAll() => _india;

  getLocalByState(String state2) => _loaixe
      .map((map) => StateModel2.fromJson(map))
      .where((item) => item.state2 == state2)
      .map((item) => item.districts2)
      .expand((i) => i)
      .toList();

  List<String> getStates() => _loaixe
      .map((map) => StateModel2.fromJson(map))
      .map((item) => item.state2)
      .toList();

  List _loaixe = [
    {
      "state2": "Ô tô dưới 10 chỗ",
      "districts2": [
        "Quận Bắc Từ Liêm -Km số 3, đường Phạm Văn Đồng, phường Cổ Nhuế 1, Tp Hà Nội/Trung Tâm đăng kiểm xe cơ giới 2927D - Hà Nội",
        "Huyện Từ Liêm - Số 454 Phạm Văn Đồng/ Trung Tâm đăng kiểm xe cơ giới 2901S",
        "Quận Nam Từ Liêm - Số 3 Lê Quang Đạo - Mỹ Đình/Trung Tâm đăng kiểm xe cơ giới 2903S - Hà Nội",
        "Quận Hoàng Mai - 685, đường Lĩnh Nam, phường Lĩnh Nam, Hoàng Mai/Trung Tâm đăng kiểm xe cơ giới 2909D - Hà Nội",
        "Quận Hoàng Mai, Bãi đỗ xe công cộng và dịch vụ Đền Lừ, phường Hoàng Văn Thụ/Trung Tâm đăng kiểm xe cơ giới 2910D - Hà Nội",
        "Huyện Thường Tín - Km21, xã Hà Hồi/Trung Tâm đăng kiểm xe cơ giới 2915D - Hà Nội",
        "Quận Long Biên- Số 49 Phố Đức Giang, Phường Đức Giang/Trung Tâm đăng kiểm xe cơ giới 2905V - Hà Nội",
        "Quận Long Biên -144/95 đường Vũ Xuân Thiều, phường Sài Đồng/Trung Tâm đăng kiểm xe cơ giới 2916D – Hà Nội, trực thuộc công ty CP đăng kiểm xe cơ giới Long Biên",
        "Quận Long Biên-Tổ 16, đường Nguyễn Văn Linh, phường Thạch Bàn/Trung Tâm đăng kiểm xe cơ giới 2917D - Hà Nội",
        "Quận Long Biên - Đường Đặng Phúc Thông- Yên Viên- Gia Lâm/ Trung Tâm đăng kiểm xe cơ giới 2902S",
        "Huyện Gia Lâm - Xã Phú Thị/Trung Tâm đăng kiểm xe cơ giới 2902V - Hà Nội",
        "Quận Hà Đông - Số 115. tổ 15, phường Kiến Hưng/Trung Tâm đăng kiểm xe cơ giới 2929D - Hà Nội",
        "Quận Hà Đông - Lô 24, cụm CN Yên Nghĩa, P. Yên Nghĩa/Trung Tâm đăng kiểm xe cơ giới 2930D - Hà Nội",
        "Quận Hà Đông - Km15 - Quốc lộ 6 /Trung Tâm đăng kiểm xe cơ giới 3301S - Hà Nội",
        "Huyện Hoài Đức - Lô 6, cụm CN Lai Xá, xã Kim Chung, Hoài Đức/Trung Tâm đăng kiểm xe cơ giới 2908D - Hà Nội",
        "Huyện Chương Mỹ - Km25, Quốc lộ 6, KCN Phú Nghĩa/Trung Tâm đăng kiểm xe cơ giới 2923D - Hà Nội",
        "Huyện Chương Mỹ - Km31, QL 6, xã Đông Sơn/Trung Tâm đăng kiểm xe cơ giới 2911D - Hà Nội",
        "Huyện  Thanh Oai - Cụm CN Thanh Oai, Bích Hòa/Trung Tâm đăng kiểm xe cơ giới 2914D - Hà Nội",
        "Huyện An Đức - Ô số 3 lô 5, Cụm công nghiệp An Khánh/Trung Tâm đăng kiểm xe cơ giới 2921D - Hà Nội",
        "Huyện Đan Phượng - Khu đất số 10 đường 254 phố Tây Sơn, thị trấn Phùng/Trung Tâm đăng kiểm xe cơ giới 2922D - Hà Nội"
      ]
    },
    {
      "state2": "Tp Hồ Chí Minh",
      "districts2": [
        "Quận 11 - 343/20 Lạc Long Quân - P.5 /Trung Tâm đăng kiểm xe cơ giới 5002S - T.p HCM",
        "Quận Bình Tân - 428/56 Quốc lộ 1, P.Bình Hưng Hoà B/Trung Tâm đăng kiểm xe cơ giới 5007V - T.p HCM",
        "Quận Bình Tân - 117/2D1, đường Hồ Văn Long, khu phố 3, P. Tân Tạo/Trung Tâm đăng kiểm xe cơ giới 5019D - T.p HCM",
        "Quận Bình Tân - Lô 13, đường số 07, KCN Tân Tạo mở rộng, phường Tân Tạo A,/Trung Tâm đăng kiểm xe cơ giới 5001S - T.p HCM",
        "Quận Thủ Đức - Số 6/6 - QL 13 - P.Hiệp Bình Chánh - /Trung Tâm đăng kiểm xe cơ giới 5003S - T.p HCM",
        "Quận Thủ Đức - 107 Đường Phú Châu - P. Tam Bình /Trung Tâm đăng kiểm xe cơ giới 5003V - T.p HCM",
        "Quận Thủ Đức - Khu phố 4, Trường Sơn, Linh Trung/Chi nhánh đăng kiểm thuộc 5003V - T.p HCM",
        "Quận 2 - Lô H4, khu công nghiệp cát lái - Cụm 2, phường Thạnh Mỹ Lợ/Trung Tâm đăng kiểm xe cơ giới 5004V - T.p HCM",
        "Quận Tân Bình -1A Hồng Hà, P.2, T.p HCM/Chi nhánh đăng kiểm XCG 5005V - T.p HCM",
        "Quận 7 - 118 Huỳnh Tấn Phát - P.Tân Thuận Tây  /Trung Tâm đăng kiểm xe cơ giới 5006V - T.p HCM",
        "Quận 9 - Số 36, Hoàng Hữu Nam/Trung Tâm đăng kiểm xe cơ giới 5015D - T.p HCM",
        "Quận 12 - 218/42 đường TA28, Phường Thới An /Trung Tâm đăng kiểm xe cơ giới 5008D - T.p HCM",
        "Quận 12 - 1143/3B, QL 1A, KP3, P. An Phú Đông/Trung Tâm đăng kiểm xe cơ giới 5005V - T.p HCM",
        "Huyện Củ Chi - 201, tỉnh lộ 8, xã Tân Thạnh Tây/Trung Tâm đăng kiểm xe cơ giới 5009D - T.p HCM",
        "Huyện Củ Chi - số 5, km14+700, đg 85, Tân Phú Trung/Trung Tâm đăng kiểm xe cơ giới 5010D - T.p HCM",
        "Huyện Bình Chánh - D3/16G, khu phố 4, thị trấn Tân Túc/Trung Tâm đăng kiểm xe cơ giới 5012D - T.p HCM trực thuộc công ty CP xăng dầu Mai Châu",
        "Huyện Bình Chánh - Số A5/20H6, Trần Đại Nghĩa, Ấp 1, Tân Kiên/Trung Tâm đăng kiểm xe cơ giới 5013D - T.p HCM trực thuộc công ty CP đăng kiểm Bình Chánh",
        "Huyện Hóc Môn - Số 5A, quốc lộ 22, quốc lộ Thới Sơn, Tp. Hồ Chí Minh/Trung Tâm đăng kiểm xe cơ giới 5014D - T.p HCM",
        "Huyện Nhà Bè - Số 1031, đường Nguyễn Hữu Thọ, ấp 2, xã Long Thới/Trung Tâm đăng kiểm xe cơ giới 5017D - T.p HCM",
        "Huyện Mê Linh, Km 8, đường Bắc Thăng Long – Nội Bài, Xã Quang Minh/Trung Tâm đăng kiểm xe cơ giới 2904V - Hà Nội",
        "Huyện Đông Anh - Thôn Sơn Du, xã Nguyên Khê, Đông Anh/Trung Tâm đăng kiểm xe cơ giới 2913D - Hà Nội",
        "Huyện Đông Anh - Km 1, QL3, Du Nội, Mai Lâm, Đông Anh/Trung Tâm đăng kiểm xe cơ giới 2907D - Hà Nội",
        "Huyện Thanh Trì - Km 15+200 Quốc lộ 1A, Thôn Yên Phú - Xã Liên Ninh / Trung Tâm đăng kiểm xe cơ giới 2901V",
        "Huyện  Thanh trì  - Km 4 - Đường 70 - Xã Tam Hiệp - Thanh trì /Trung Tâm đăng kiểm xe cơ giới 2906V - Hà Nội",
        "Huyện Sóc Sơn Km 21+200 QL3, Mai Đình, Hà Nội/Trung Tâm đăng kiểm xe cơ giới 2912D - Hà Nội",
        "Thị Xã Sơn tây - Phường Quang Trung /Trung Tâm đăng kiểm xe cơ giới 3302S - Hà Nội",
        "Thị xã Sơn Tây -Km2+100, đường tránh QL32, xã Thanh Mỹ/Trung Tâm đăng kiểm xe cơ giới 2918D - Hà Nội"
      ]
    },
    {
      "state2": "An Giang",
      "districts2": [
        "T.p Long Xuyên - 67 khóm Thới Hoà, P.Mỹ Thạnh/Trung Tâm đăng kiểm xe cơ giới 6701S - An Giang",
        "TX Châu Đốc -68 Châu Phú A /Trung Tâm đăng kiểm xe cơ giới 6702S -  An Giang",

        "Tp. Châu Đốc-Tuyến tránh QL 91 (N1), Khóm Hòa Bình, phường Vĩnh Mỹ, /Trung Tâm đăng kiểm xe cơ giới 6703D - An Giang"
      ]
    },
    {
      "state2": "Bà rịa – Vũng tàu",
      "districts2": [
        "TP Vũng Tàu- 47B, Đường 30/4, P. Thắng Nhất/Trung Tâm đăng kiểm xe cơ giới 7201S - Bà Rịa Vũng Tàu",
        "TX Bà Rịa -QL51, KP2, Phước Trung, -/Trung Tâm đăng kiểm xe cơ giới 7202D - Bà Rịa Vũng Tàu",
        "Huyện Tân Thành-Đường 1, thị trấn Phú Mỹ/Trung Tâm đăng kiểm xe cơ giới 7203D - Bà Rịa Vũng Tàu",
        "Huyện Đất Đỏ-Đường D6, khu công nghiệp Đất Đỏ 1./Trung Tâm đăng kiểm xe cơ giới 7204S - Bà Rịa Vũng Tàu",

      ]
    },
    {
      "state2": "Bắc Giang",
      "districts2": [
        "TP. Bắc Giang-Đồi Chỉ Chèo - P.Xương Giang /Trung Tâm đăng kiểm xe cơ giới 9801S - Bắc Giang",
        "TP. Bắc Giang- Km2, đường Hoàng Hoa Thám, P. Đại Mai/Trung Tâm đăng kiểm xe cơ giới 9802D - Bắc Giang",
        "Huyện Hiệp Hòa-Xã Lương Phong-Thôn chớp/Trung Tâm đăng kiểm xe cơ giới 9804D - Bắc Giang",
        "Huyện Yên Dũng-Xã Hương Gián-Thôn Dõn/Trung Tâm đăng kiểm xe cơ giới 9805D - Bắc Giang",
        "Huyện Lạng Giang-Xã Phi Mô -Cụm công nghiệp Tân Dĩnh /Trung Tâm đăng kiểm xe cơ giới 9803D - Bắc Giang",
        "Huyện Lạng Giang-Xã Phi Mô, thị trấn Vôi-Cụm công nghiệp Tân Dĩnh/Trung Tâm đăng kiểm xe cơ giới 9805D - Bắc Giang",

      ]
    },
    {
      "state2": "Bắc Kạn",
      "districts2": ["TX Bắc Kạn - Tổ 9 - Phùng Chí Kiên /Công ty cổ phần đăng kiểm Bắc Kạn - 9701D"]
    },
    {
      "state2": "Bạc Liêu",
      "districts2": [ "Huyện Vĩnh Lợi-Xã Long Thạnh- QL 1 - Phường 7 /Trung tâm đăng kiểm xe cơ giới 9401V - Bạc Liêu"]
    },
    {
      "state2": "Bắc Ninh",
      "districts2": [
        "TP. Bắc Ninh - Khu 7 - P.Thị Cầu /Trung Tâm đăng kiểm xe cơ giới 9901S - Bắc Ninh",
        "Xã Tam Sơn – TX Từ Sơn - Thôn Dương Sơn /Trung Tâm đăng kiểm xe cơ giới 9902S - Bắc Ninh",
        "Huyện Quế Võ- Km 10, QL 18, TT Phố Mới/Trung Tâm đăng kiểm xe cơ giới 9903D - Bắc Ninh",
        "Huyện Lương TàiXã Lâm Thao-Khu công nghiệp Lâm Bình, /Trung Tâm đăng kiểm xe cơ giới 9904D - Bắc Ninh",
        "Huyện Thuận Thành-Xã Ngọc Nội-Thôn Ngọc Trì./Công ty cổ phần đầu tư xây dựng và tư vấn đăng kiểm – Trung tâm đăng kiểm xe cơ giới 9905D- Bắc Ninh",

      ]
    },
    {
      "state2": "Bến Tre",
      "districts2": ["TX Bến Tre -Số 7 - Nguyễn Văn Tư - P7 /Trung Tâm đăng kiểm xe cơ giới 7101S - Bến Tre", "Huyện Mỏ Cày Bắc-xã Tân Thành Bình-Ấp Tân Long 1-QL60/Trung Tâm đăng kiểm xe cơ giới 7102D - Bến Tre"]
    },
    {
      "state2": "Bình Định",
      "districts2": [
        "TP.Quy Nhơn - Bình Định-71 Tây Sơn /Trung Tâm đăng kiểm xe cơ giới 7701S - Bình Định",
        "Tp.Quy Nhơn -LôA1.01 (khu A), khu kinh tế Nhơn Hội, xã Nhơn Hội/Trung Tâm đăng kiểm xe cơ giới 7704D - Bình Định",
        "Huyện Phú Mỹ-Xã Mỹ Châu  -QLộ 1A - Thôn Vạn Lương /Trung Tâm đăng kiểm xe cơ giới 7702S - Bình Định",

      ]
    },
    {
      "state2": "Bình Dương",
      "districts2": [
        "TP. Thủ Dầu Một- QL13 - P.Hiệp thành /Trung Tâm đăng kiểm xe cơ giới 6101S - Bình Dương",
        "TP. Thủ Dầu Một-Khu phố 9, phường Phú Hòa/Trung Tâm đăng kiểm xe cơ giới 6103S - Bình Dương",
        "TP. Thủ Dầu Một- Đường ĐX 82, Khu 2, P. Định Hòa/Trung Tâm đăng kiểm xe cơ giới 6103D - Bình Dương",
        "Tp. Dĩ An -Đường Nguyễn Thị Minh Khai, khu phố Tân Thắng, phường Tân Bình/Trung Tâm đăng kiểm xe cơ giới 6102S - Bình Dương",
        "TP.Thuận An-Đường Thạnh Bình-414/3B ĐL Bình Dương,/Trung Tâm đăng kiểm xe cơ giới 6104D - Bình Dương",
        "Phường Khánh Bình, thị xã Tân Uyên-Thửa đất số 117, tờ bản đồ số 23, KCN Nam Tân Uyên, /Trung Tâm đăng kiểm xe cơ giới 6105D - Bình Dương",
        "Phường Tân Bình, thị xã Dĩ An-Số 216, khu phố 1/Trung Tâm đăng kiểm xe cơ giới 6106D - Bình Dương",
        "Phường Bình Hòa, Tx. Thuận Anh-19/2 khu phố Bình Đáng/Trung Tâm đăng kiểm xe cơ giới 6109D - Bình Dương",

        "Phường Mỹ Phước, Tx. Bến Cát-291, QL 13, Khu 2/Trung Tâm đăng kiểm xe cơ giới 6110D - Bình Dương"
      ]
    },
    {
      "state2": "Bình Phước",
      "districts2": [
        "TX Đồng Xoài - P. Tân Xuân /Trung Tâm đăng kiểm xe cơ giới 9301S - Bình Phước",
        "Huyện Chơn Thành-Xã Minh Hưng-Tổ 1, Ấp 9/Trung Tâm đăng kiểm xe cơ giới 9302D - Bình Phước",

      ]
    },
    {
      "state2": "Bình Thuận",
      "districts2": [
        "TP.Phan Thiết -Số 5 Từ Văn Tư/Trung Tâm đăng kiểm xe cơ giới 8601S - Bình Thuận",
        "Huyện Hàm Thuận Nam-Xã Tân Lập-Km 32/Trung Tâm đăng kiểm xe cơ giới 8602D - Bình Thuận",

      ]
    },
    // {
    //   "state": "Cà Mau",
    //   "districts2": [
    //
    //     "TP. Cà Mau-Ấp 5 - Xã An Xuyên  /Trung tâm Đăng kiểm xe cơ giới 6901V - Cà Mau"
    //   ]
    // },
    // {
    //   "state": "Cần Thơ",
    //   "districts2": [
    //     "Quận Bình Thuỷ, Cần Thơ-19A, KCN Trà nóc 1/Trung Tâm kiểm định kỹ thuật phương tiện thiết bị thủy bộ Cần Thơ 6501S - Cần Thơ",
    //     "Quận Cái Răng-KV1, phường Hưng Thạnh,/Chi nhánh Trung Tâm kiểm định kỹ thuật phương tiện thiết bị thủy bộ Cần Thơ 6502S - Cần Thơ",
    //     "Quận Bình Thủy, Cần Thơsố 26B, Nguyễn Văn Linh, phường Long Hòa./Trung Tâm Đăng kiểm xe cơ giới 6502D - Cần Thơ",
    //     "Quận Ô Môn- 9A, Quốc lộ 91B, Khu vực Bình Hòa A, phường Phước Thới,/Trung Tâm Đăng kiểm xe cơ giới 6503D - Cần Thơ",
    //
    //     "Quận Thốt Nốt - Khu vực Tràng Thọ 1, phường Thốt Nốt, /Trung Tâm Đăng kiểm xe cơ giới 6504D - Cần Thơ"
    //   ]
    // },
    // {
    //   "state": "Cao Bằng",
    //   "districts": [
    //     "Phường Sông Hiến - Km4/Trung Tâm đăng kiểm xe cơ giới 1101S - Cao Bằng ",
    //     "Phường Ngọc Xuân -Tổ 8/Trung tâm đăng kiểm xe cơ giới 1102D - Cao Bằng trực thuộc công ty TNHH đăng kiểm Cao Bằng"
    //   ]
    // },
    // {
    //   "state": "Đà Nẵng",
    //   "districts": [
    //     "Q.Liên Chiểu- P.Hòa Minh -25 Hoàng Văn Thái  /Trung Tâm đăng kiểm xe cơ giới 4301S - Đà Nẵng",
    //     "Huyện Hoà Vang-Xã Hoà Châu - Km 800 + 40 /Trung Tâm đăng kiểm xe cơ giới 4302S - Đà Nẵng",
    //
    //     "Q. Cẩm Lệ-P.Hòa Thọ Tây-Đường số 01, KCN Hòa Cầm/Trung Tâm đăng kiểm xe cơ giới 4304D - Đà Nẵng"
    //   ]
    // },
    // {
    //   "state": "Đắk Lắk",
    //   "districts": [
    //     "TP Buôn Mê Thuột -Phường Tân An -Km 4+500 - QL 14 /Trung Tâm đăng kiểm xe cơ giới 4701D - Đăklăk",
    //     "Xã Hoà Phú Km 12 - QL 14 – Thôn 7/Trung Tâm đăng kiểm xe cơ giới 4702D - Đăklăk",
    //     "Xã Ea Đar-Thôn 9, Eakar/Trung Tâm đăng kiểm xe cơ giới 4703D - Đăklăk",
    //     "TP. Buôn Ma Thuột-75 Nguyễn Thị Định, P. Thành Nhất/Trung Tâm đăng kiểm xe cơ giới 4704D - Đăklăk",
    //
    //     "Thôn Pơng Drang, Krông Buk/Trung Tâm đăng kiểm xe cơ giới 4705D - Đăklăk"
    //   ]
    // },
    // {
    //   "state": "Đắk Nông",
    //   "districts": [
    //
    //     "TX Gia Nghĩa-P Nghĩa Tân-Km 3 QL 14, Tổ 4/Công ty cổ phần đăng kiểm xe cơ giới ĐakNông - 4801D"
    //   ]
    // },
    // {
    //   "state": "Điện Biên",
    //   "districts": [
    //
    //     "TP Điện Biên Phủ-Phố 10 - phường Thanh Trường /Trung Tâm đăng kiểm xe cơ giới 2701S - Điện Biên"
    //   ]
    // },
    // {
    //   "state": "Đồng Nai",
    //   "districts": [
    //     "TP Biên Hoà-P.An Bình - Số 25, Đường 2A, KCN Biên Hoà II -  - Tỉnh Đồng Nai/Trung Tâm đăng kiểm xe cơ giới 6001S - Đồng Nai",
    //     "TP Long Khánh-Huyện Xuân lộc - Khu Xuân Bình/Trung Tâm đăng kiểm xe cơ giới 6002S - Đồng Nai",
    //     " Huyện Định Quán-Xã Ngọc Định  -QL 20, Ấp Trung Hoà, /Trung Tâm đăng kiểm xe cơ giới 6003S - Đồng Nai",
    //     "TP Biên Hòa-Số 1A, xa lộ Hà Nội, phường Tân Biên/Trung Tâm đăng kiểm xe cơ giới 6004D - Đồng Nai",
    //     "TP. Biên Hòa-370/2A Võ Nguyên Giáp, xã Phước Tân,/Trung Tâm đăng kiểm xe cơ giới 6005D - Đồng Nai",
    //
    //     " Huyện Long Thành-Xá An Phước/Trung Tâm đăng kiểm xe cơ giới 6006D - Đồng Nai"
    //   ]
    // },
    // {
    //   "state": "Đồng Tháp",
    //   "districts": [
    //
    //     "TP Cao lãnh-Số 386, Ấp 1, Điện Biên Phủ, xã Mỹ Trà/Trung Tâm đăng kiểm xe cơ giới 6601S - Đồng Tháp"
    //   ]
    // },
    // {
    //   "state": "Gia Lai",
    //   "districts": [
    //     "TP.Pleiku-Xã Biển Hồ- Làng Phung /Trung Tâm đăng kiểm xe cơ giới 8102D - Gia Lai",
    //     "TP. Pleiku- P. Chi Lăng- Nguyễn Chí Thanh, tổ 5 /Công ty TNHH đăng kiểm xe cơ giới 8103D - Gia Lai",
    //     "Huyện Đak Bơ-Xã Đak Bơ-thôn 2 /Trung Tâm đăng kiểm xe cơ giới 8104D",
    //     "Tp Pleiku-Xã Diên Phú-Lô C50 Cụm CN Diên Phú, thôn 3/Trung Tâm đăng kiểm xe cơ giới 8105D",
    //
    //   ]
    // },
    // {
    //   "state": "Hà Giang",
    //   "districts": [
    //     "TP. Hà Giang-Tổ 17 - Phường Nguyễn Trãi - /Trung Tâm đăng kiểm xe cơ giới 2301S - Hà Giang"
    //   ]
    // },
    // {
    //   "state": "Hà Nam",
    //   "districts": [ "T.P Phủ Lý - Xã Liêm Tiết/Trung Tâm đăng kiểm xe cơ giới 9001S - Hà Nam"]
    // },
    // {
    //   "state": "Hà Tĩnh",
    //   "districts": [
    //     "Phường Đậu Liêu, Thị xã Hồng Lĩnh- km486+354 QL1A, /Trung tâm đăng kiểm xe cơ giới 3802D - Hà Tĩnh",
    //     "Phường Kỳ Trinh, thị xã Kỳ Anh/Trung tâm đăng kiểm xe cơ giới 3803D - Hà Tĩnh",
    //     "Huyện Thạch Hà-Xã Thạch Đài- Km 9 tránh Hà Tĩnh/Công ty cổ phần đăng kiểm Hà Tĩnh - 3801D",
    //
    //     "Huyện Đức Thọ-Xã Trung Lễ/Trung tâm đăng kiểm xe cơ giới 3804D - Hà Tĩnh"
    //   ]
    // },
    // {
    //   "state": "Hải Dương",
    //   "districts": [
    //     "TP.Hải Dương-Đường Tân Dân, P. Việt Hòa/Công ty cổ phần đăng kiểm xe cơ giới Hải Dương - 3401D",
    //     "TP.Hải Dương-Km 33+300, cụm CN II, p. Văn An, thị xã Chí Linh/Trung Tâm đăng kiểm xe cơ giới 3402D - Hải Dương",
    //     "Huyện Ninh Giang-thôn Dân, xã Đồng Tâm/thôn Dân, xã Đồng Tâm, huyện Ninh Giang, tỉnh Hải Dương",
    //     "Huyện Kim Thành-Thôn Quỳnh Khê, xã Kim Xuyên/Trung Tâm đăng kiểm xe cơ giới 3404D - Hải Dương",
    //
    //     "Tp. Hải Dương - Xã Liên Hồng -Phân khu 2, đô thị mới phía nam thành phố Hải Dương/Trung Tâm đăng kiểm xe cơ giới 3405D - Hải Dương"
    //   ]
    // },
    // {
    //   "state": "Hải Phòng",
    //   "districts": [
    //     "Quận Hồng Bàng - Km 90 QL 5 mới, Khu Cam Lộ 2/ Trung Tâm đăng kiểm xe cơ giới 1501V - Hải Phòng",
    //     "Quận Hải An - Khu Hạ Đoạn 2, P. Đông Hải 2/Trung Tâm đăng kiểm xe cơ giới 1502S - Hải Phòng",
    //     "Huyện Thuỷ Nguyên, Xã Kênh Giang - Trung Tâm đăng kiểm xe cơ giới 1503D - Hải Phòng",
    //     "Huyện Vĩnh Bảo - Cụm CN Cầu Nghìn, xã Hưng Nhân/Trung Tâm đăng kiểm xe cơ giới 1504D - Hải Phòng",
    //     "Quận Ngô Quyền - Số 1 đường Lê Thánh Tông, phường Máy Tơ/Trung Tâm đăng kiểm xe cơ giới 1505D - Hải Phòng",
    //     "Quận Ngô Quyền, phường Máy Tơ, Số 01 đường Lê Thánh Tông, Tp. Hải Phòng/Trung Tâm đăng kiểm xe cơ giới 1506D - Hải Phòng",
    //     "Quận Kiến An, phường Đồng Hòa, Tổ dân phố Đồng Tâm, Tp. Hải Phòng/ Trung Tâm đăng kiểm xe cơ giới 1507D - Hải Phòng"
    //   ]
    // },
    // {
    //   "state": "Hậu Giang",
    //   "districts": [
    //     "Huyện Châu Thành A-Xã Tân Phú Thạnh - Km 2085 - QL 1/Trung Tâm đăng kiểm xe cơ giới 9501S - Hậu Giang",
    //     "Huyện Châu Thành A-Xã Nhơn Nghĩa A-QL 91C, Ấp Nhơn Thuận 1/Trung Tâm đăng kiểm xe cơ giới 9502D - Hậu Giang",
    //
    //   ]
    // },
    // {
    //   "state": "Hòa Bình",
    //   "districts": [
    //
    //     "TP Hòa Bình-Km 71+100 - Quốc lộ 6 - P.Đồng Tiến/Trung Tâm đăng kiểm xe cơ giới 2801S - Hoà Bình"
    //   ]
    // },
    // {
    //   "state": "Hưng Yên",
    //   "districts": [
    //     "Xã Dị Sử - TX.Mỹ Hào/Trung Tâm đăng kiểm xe cơ giới 8901S - Hưng Yên",
    //     "Xã Bảo Khê - TX Hưng Yên - Thôn Tiền Thắng /Trung Tâm đăng kiểm xe cơ giới 8902S - Hưng Yên",
    //     "Huyện Văn Giang-Xã Long Hưng, tỉnh Hưng Yên-Thôn Lại Ốc/Trung Tâm đăng kiểm xe cơ giới 8904D - Hưng Yên",
    //     "North Huyện Yên Mỹ-thị trấn Yên Mỹ-Thôn Nghĩa Trang /Trung Tâm đăng kiểm xe cơ giới 8905D - Hưng Yên",
    //     "Huyện Kim Động-Xã Nghĩa Dân-Thửa đất số 302, tờ bản đồ số 07/Trung Tâm đăng kiểm xe cơ giới 8906D - Hưng Yên",
    //
    //   ]
    // },
    // {
    //   "state": "Khánh Hòa",
    //   "districts": [
    //     "TP. Nha Trang - Đường 2 tháng 4 -Khu Đồng Đế - P.Vĩnh Hoà /Trung Tâm đăng kiểm xe cơ giới 7901S - Khánh Hoà",
    //     "TP.Cam Ranh-QL1A, Phú Sơn, P.Cam Phú/Trung Tâm đăng kiểm xe cơ giới 7902S - Khánh Hoà",
    //
    //   ]
    // },
    // {
    //   "state": "Kiên Giang",
    //   "districts": [
    //
    //     "Huyện Châu Thành-Xã Vĩnh Hòa Hiệp-Khu dân cư BX liên tỉnh, đường số 2, ấp So Đũa/Trung Tâm đăng kiểm xe cơ giới 6801S - Kiên Giang"
    //   ]
    // },
    // {
    //   "state": "Kon Tum",
    //   "districts": [
    //     "TX Kon Tum - Tỉnh Kon Tum-Số 99 Huỳnh Thúc Kháng /Trung Tâm đăng kiểm xe cơ giới 8201S - Kon Tum",
    //
    //   ]
    // },
    // {
    //   "state": "Lai Châu",
    //   "districts": [
    //     "Phường Tân Phong, Thị xã Lai Châu/Trung Tâm đăng kiểm xe cơ giới 2501S - Lai Châu"
    //   ]
    // },
    // {
    //   "state": "Lâm Đồng",
    //   "districts": [
    //     "TP. Đà Lạt-Số 1 Tô Hiến Thành - P.3 /Trung Tâm đăng kiểm xe cơ giới 4901S - Lâm Đồng",
    //     "TX Bảo Lộc-01 Huỳnh Thúc Kháng, P.2/Trung Tâm đăng kiểm xe cơ giới 4902S - Lâm Đồng",
    //
    //     "Thị trấn Liên Nghĩa, Đức Trọng/Chi nhánh trung tâm đăng kiểm xe cơ giới Lâm Đồng - 4903S"
    //   ]
    // },
    // {
    //   "state": "Lạng Sơn",
    //   "districts": [
    //     "Phường Vĩnh Trại - 50 Lê Đại Hành - Lạng Sơn/Trung tâm đăng kiểm xe cơ giới 1201D, trực thuộc công ty cổ phần đăng kiểm xe cơ giới  Lạng Sơn",
    //     "Huyện Cao Lộc - tổ 5, khối 1+2, thị trấn Cao Lộc/Trung tâm đăng kiểm xe cơ giới 1202D, trực thuộc công ty cổ phần đăng kiểm xe cơ giới  Lạng Sơn"
    //   ]
    // },
    // {
    //   "state": "Lào Cai",
    //   "districts": [
    //     " Tp Lào Cai -Phường Bắc Cường/Công ty cổ phần đăng kiểm xe cơ giới giao thông Lào Cai - 2401D"
    //   ]
    // },
    // {
    //   "state": "Long An",
    //   "districts": ["Phường 5 - Thị xã Tân An -Số 12 Quốc Lộ 1/Trung Tâm đăng kiểm xe cơ giới 6201S - Long An",
    //     "Thị trấn Bến Lức -356 KP9, QL1A, /Trung Tâm đăng kiểm xe cơ giới 6202D - Long An",
    //     "Huyện Đức Hòa-Xã Đức Hòa Hạ-Khu Công nghiệp Hải Sơn, ấp Bình Tiền 2/Trung Tâm đăng kiểm xe cơ giới 6203D - Long An"
    //
    //
    //   ]
    // },
    // {
    //   "state": "Nam Định",
    //   "districts": [
    //     "Huyện Mỹ Lộc - xã Mỹ Tân - Km 101, QL10 /Trung Tâm đăng kiểm xe cơ giới 1801S - Nam Định",
    //     "TP Nam Định - Số 3 Quang Trung/Trung Tâm đăng kiểm xe cơ giới 1802S - Nam Định",
    //     "Huyện Nam Trực-Xã Nghĩa An, - Km 150+800 (Phải tuyến) QL 21 (Đường Lê Đức Thọ)/Trung Tâm đăng kiểm xe cơ giới 1802D - Nam Định (Công ty Cổ phần phát triển công nghệ điện thông)",
    //     "Huyện Hải Hậu - Xã Hải Thanh/Trung Tâm đăng kiểm xe cơ giới 1803D - Nam Định"
    //   ]
    // },
    // {
    //   "state": "Nghệ An",
    //   "districts": ["TP Vinh-72 Phan Bội Châu/Trung Tâm đăng kiểm xe cơ giới 3701S - Nghệ An",
    //     "TP Vinh,-Khối 9, phường Quán Bàu/Trung Tâm đăng kiểm xe cơ giới 3709D - Nghệ An",
    //     "Xã Đông Hiếu – Thị xã Thái Hoà/Trung Tâm đăng kiểm xe cơ giới 3702S - Nghệ An",
    //     "Huyện Nghi Lộc-Xã Nghi Thạch, Km 6, QL 46/Trung Tâm đăng kiểm xe cơ giới 3703D - Nghệ An",
    //     "Huyện Diễn Châu-Xã Diễn Hòng, /Trung Tâm đăng kiểm xe cơ giới 3704D - Nghệ An",
    //     "Huyện Nghi Lộc-Xã Nghi Long -Xóm 1, /Trung Tâm đăng kiểm xe cơ giới 3705D - Nghệ An",
    //     "Huyện Đô Lương-Xã Yên Sơn-QL7B/Trung Tâm đăng kiểm xe cơ giới 3706D - Nghệ An",
    //     "Huyện Hưng Nguyên-Xã Hưng Thịnh-Xóm 3/Trung Tâm đăng kiểm xe cơ giới 3708D - Nghệ An"
    //   ]
    // },
    // {
    //   "state": "Ninh Bình",
    //   "districts": ["TP. Ninh Bình-Số 58 đường Trần Nhân Tông, phố An Hòa, phường Ninh Phong/Trung Tâm đăng kiểm xe cơ giới 3501D - Ninh Bình (Công ty cổ phần đăng kiểm xe cơ giới Ninh Bình)","TP Ninh Bình-Phố Bích Sơn, P. Bích Đào, /Trung Tâm đăng kiểm xe cơ giới 3502D - Ninh Bình", "Tp. Tam Điệp-Tổ 2, phường Bắc Sơn/Trung Tâm đăng kiểm xe cơ giới 3503D - Ninh Bình"]
    // },
    // {
    //   "state": "Ninh Thuận",
    //   "districts": [
    //     "Huyện Ninh Phước-Thị trấn Phước Dân -Thôn Bình Quý /Trung Tâm đăng kiểm xe cơ giới 8501S - Ninh Thuận",
    //
    //   ]
    // },
    // {
    //   "state": "Phú Thọ",
    //   "districts": [
    //     "TP. Việt Trì - 2821, đại lộ Hùng Vương, p. Vân Cơ/Trung Tâm đăng kiểm xe cơ giới 1901V - Phú Thọ",
    //     "Xã Phú Hộ, thị xã Phú Thọ -QL2, Khu 3/Trung Tâm đăng kiểm xe cơ giới 1902D - Phú Thọ",
    //     "Huyện Lâm Thao Khu 4, xã Kinh Kệ/Trung TâmC34:C35cơ giới 1904D - Phú Thọ",
    //     "Huyện Thanh Sơn - Khu Bãi Tần, thị trấn Thanh Sơn/Trung Tâm đăng kiểm xe cơ giới 1905D - Phú Thọ",
    //     "Tp. Việt Trì - Khu Hóc Tranh, xóm Mai, xã Trưng Vương/Trung Tâm đăng kiểm xe cơ giới 1906 - Phú Thọ"
    //   ]
    // },
    // {
    //   "state": "Phú Yên",
    //   "districts": [
    //     "TP. Tuy Hòa- Xã Bình Kiến-P.9 /Trung Tâm đăng kiểm xe cơ giới 7801S - Phú Yên",
    //     "Huyện Sơn HòaXã Suối Bạc-Km48+450, Quốc lộ 25/Trung Tâm đăng kiểm xe cơ giới 7802D - Phú Yên",
    //     "Huyện Tuy An-Xã An Chấn-Km 1319+300, Quốc lộ 1A/Trung Tâm đăng kiểm xe cơ giới 7803D - Phú Yên",
    //
    //   ]
    // },
    // {
    //   "state": "Quảng Bình",
    //   "districts": [
    //     "T.P Đồng Hới -Đường Hữu Cảnh /Trung Tâm đăng kiểm xe cơ giới 7301S - Quảng Bình",
    //     "Huyện Quảng Trạch-Xã quảng Xuân -Thôn Thanh Lương/Trung Tâm đăng kiểm xe cơ giới 7302D - Quảng Bình",
    //     "Huyện Quảng Ninh-Xã Vĩnh Ninh-Thôn Lệ Kỳ 1/Trung Tâm đăng kiểm xe cơ giới 7303D - Quảng Bình",
    //
    //   ]
    // },
    // {
    //   "state": "Quảng Nam",
    //   "districts": [
    //     "Huyện Thăng Bình-Thị trấn Hà Lam, Quảng Nam -Ngã ba Tây Cốc/Công ty cổ phần đăng kiểm Quảng Nam - 9201D",
    //     "TX. Điện Bàn-QL. 1A, khối Phong Nhị, P. Điện An/Trung Tâm đăng kiểm xe cơ giới 9202D - Quảng Nam",
    //
    //   ]
    // },
    // {
    //   "state": "Quảng Ngãi",
    //   "districts": [
    //     "Huyện Sơn Tịnh-Xã Tịnh Phong /Trung Tâm đăng kiểm xe cơ giới 7601S - Quảng Ngãi",
    //     "Huyện Tư Nghĩa-Xã Nghĩa Phương, -QL 1A, thôn Năng Tây 3/Trung Tâm đăng kiểm xe cơ giới 7602D - Chi nhánh Công ty CP Thuận Phát",
    //     "Huyện Bình Sơn-Xã Bình Hòa-Thôn 4/Trung Tâm đăng kiểm xe cơ giới 7603D - Quảng Ngãi",
    //     "Huyện Nghĩa Hành-Xã Hành Thuận/Trung Tâm đăng kiểm xe cơ giới 7604D - Quảng Ngãi",
    //
    //   ]
    // },
    // {
    //   "state": "Quảng Ninh",
    //   "districts": ["Tp. Hạ Long - Phường Hà Phong /Trung Tâm đăng kiểm xe cơ giới Hạ Long 1401D - Quảng Ninh",
    //     "Tp Uông Bí - Phường Thanh Sơn /Trung Tâm đăng kiểm xe cơ giới Uông Bí 1402D - Quảng Ninh",
    //     "TP. Móng Cái - Km 9, xã Hải Đông /Trung Tâm đăng kiểm xe cơ giới Móng Cái 1403D - Quảng Ninh",
    //     "Tp. Cẩm Phả - Tổ 5, khu 11, Phường Mông Dương/Trung Tâm đăng kiểm xe cơ giới Móng Cái 1404D - Quảng Ninh",
    //     "Tp. Cẩm Phả - Tổ 1, khu 4, P. Quang Hanh/Trung Tâm đăng kiểm xe cơ giới Móng Cái 1407D - Quảng Ninh",
    //     "Tp. Hạ Long - Ô đất số 9,10,34 và 35, lô ĐNN_D thuộc Cụm Công nghiệp Hà Khánh/Trung Tâm đăng kiểm xe cơ giới Móng Cái 1405D - Quảng Ninh",
    //     "Tp. Hạ Long - Khu CN Cái Lân, phường Giếng Đáy/Trung Tâm đăng kiểm xe cơ giới Móng Cái 1406D - Quảng Ninh"
    //
    //   ]
    // },
    // {
    //   "state": "Quảng Trị",
    //   "districts": [
    //     "TP.Đông Hà - 61 Lý Thương Kiệt - /Trung Tâm đăng kiểm phương tiện cơ giới thủy bộ 7401S - Quảng Trị",
    //     "TP Đông Hà, Quảng Trị-Km 4 +700 Điện biên Phủ (9D), phường Đông Lương/Chi nhánh Trung Tâm đăng kiểm phương tiện cơ giới thủy bộ 7402S - Quảng Trị",
    //     "Tp. Đông Hà-Đường Điện Biên Phủ, phường Đông Lương/Trung Tâm đăng kiểm phương tiện cơ giới 7403D - Quảng Trị",
    //     "Huyện Gio Linh-Xã Gio Châu-Hà Thanh/Trung Tâm đăng kiểm phương tiện cơ giới 7402D - Quảng Trị",
    //
    //   ]
    // },
    // {
    //   "state": "Sóc Trăng",
    //   "districts": [
    //     "TX Sóc Trăng-191A - Trần Hưng Đạo /Trung tâm đăng kiểm xe cơ giới 8301V - Sóc Trăng",
    //     "Huyện Châu Thành-Xã Hồ Đắc Kiện-Ấp Xây Đá B /Trung tâm đăng kiểm xe cơ giới 8302D - Sóc Trăng",
    //
    //   ]
    // },
    // {
    //   "state": "Sơn La",
    //   "districts": [
    //     "TP Sơn La-Tổ 8 Phường Quyết Thắng /Trung Tâm đăng kiểm xe cơ giới 2602D - Sơn La (Công ty cổ phần đăng kiểm cơ giới thủy bộ Sơn La)",
    //     "TP Sơn La-Bản Noọng La, phường chiềng Sinh - /Trung Tâm đăng kiểm xe cơ giới 2601D - Sơn La",
    //     "Huyện Vân Hồ-Km177, Quốc lộ 6, Bản Chiềng Đi 1, xã Vân Hồ/Trung Tâm đăng kiểm xe cơ giới 2603D - Sơn La"
    //   ]
    // },
    // {
    //   "state": "Tây Ninh",
    //   "districts": [
    //     "Xã Ninh Sơn - Thị Xã Tây Ninh -Tỉnh lộ 4/Trung Tâm đăng kiểm xe cơ giới 7001S - Tây Ninh",
    //     "Ấp Lộc Trát, TX Tràng Bảng-Đường tránh xuyên Á/Trung Tâm đăng kiểm xe cơ giới 7002S - Tây Ninh",
    //     "Huyện Tân Châu-xã Thạnh Đông-Ấp Thạnh Hưng, đường 793/Trung Tâm đăng kiểm xe cơ giới 7003D - Tây Ninh",
    //
    //   ]
    // },
    // {
    //   "state": "Thái Bình",
    //   "districts": [
    //     "Phường Trần Hưng Đạo/Trung Tâm đăng kiểm xe cơ giới 1701D- Thái Bình",
    //     "Huyện Đông Hưng -Thôn Nam quán, xã Đông Các/Trung Tâm đăng kiểm xe cơ giới 1702D - Thái Bình"
    //   ]
    // },
    // {
    //   "state": "Thái Nguyên",
    //   "districts": [
    //     "T.p Thái Nguyên - Tổ 1A, Phường Tân lập /Trung Tâm đăng kiểm xe cơ giới 2001S - Thái Nguyên",
    //     "T.p Thái Nguyên -Xóm Ao Vàng, Xã Cao Ngạn,/Trung Tâm đăng kiểm xe cơ giới 2002S - Thái Nguyên",
    //     "TP. Sông Công - Cụm công nghiệp Nguyên Gon, phường Cải Đan/Trung Tâm đăng kiểm xe cơ giới 2003D - Thái Nguyên",
    //     "Huyện Phú Lương-Xóm 9, xã Cổ Lũng/Trung Tâm đăng kiểm xe cơ giới 2004D - Thái Nguyên",
    //     "T.p Thái Nguyên - Ngõ 845, đường Dương Tự Minh, tổ 6, phường Quang Vinh/Trung Tâm đăng kiểm xe cơ giới 2005D - Thái Nguyên",
    //     "T.p Thái Nguyên - Ngõ 398, đường Thống Nhất, phường Đồng Quang/Trung Tâm đăng kiểm xe cơ giới 2006D - Thái Nguyên",
    //     "T.p Thái Nguyên- Tổ 2, phường Cam Giá/Trung Tâm đăng kiểm xe cơ giới 2007D - Thái Nguyên"
    //   ]
    // },
    // {
    //   "state": "Thanh Hóa",
    //   "districts": [
    //     " TP Thanh Hóa- 267 Bà Triệu -Phường Đông Thọ /Trung Tâm đăng kiểm xe cơ giới 3601S - Thanh Hoá",
    //     " TP Thanh Hóa-Phường Bắc Sơn - TX Bỉm Sơn /Trung Tâm đăng kiểm xe cơ giới 3602S - Thanh Hoá",
    //     " TP Thanh Hóa-Đường Võ Nguyên Giáp, P. Quảng Thành/Trung Tâm đăng kiểm xe cơ giới 3603D - Thanh Hoá",
    //     " TP Thanh Hóa-Phố 7, Phường Quảng Thắng/Trung Tâm đăng kiểm xe cơ giới 3604D - Thanh Hoá",
    //     "Huyện Thạch Thành- Xã Thạch Quảng/Trung Tâm đăng kiểm xe cơ giới 3605D - Thanh Hoá",
    //     "Huyện Ngọc Lặc-Khu phố Ngọc Minh, thị trấn Ngọc Lặc/Trung Tâm đăng kiểm xe cơ giới 3606D - Thanh Hoá",
    //     "Xã Đông Hoàng-Huyện Đông Sơn/Trung Tâm đăng kiểm xe cơ giới 3608D - Thanh Hoá ",
    //
    //     "Tp Thanh Hóa -25/38 Phú Thọ 3, Phường Phú Sơn/Trung Tâm đăng kiểm xe cơ giới 36009 - Thanh Hoá"
    //   ]
    // },
    // {
    //   "state": "Thừa Thiên Huế",
    //   "districts": [
    //     "TP. Huế-150 Đường Điện Biên Phủ /Trung Tâm đăng kiểm xe cơ giới 7501S - Huế",
    //     "TP. Huế-P.Hương Văn, TX.Hương Trà/Trung Tâm đăng kiểm xe cơ giới 7502S - Huế",
    //
    //   ]
    // },
    // {
    //   "state": "Tiền Giang",
    //   "districts": [
    //     "Huyện Châu Thành -Thân Cửu nghĩa /Trung Tâm đăng kiểm xe cơ giới 6301S - Tiền Giang",
    //     "Huyện Châu Thành-Xã Tam Hiệp, tỉnh Tiền Giang/Trung Tâm đăng kiểm xe cơ giới 6302D - Tiền Giang",
    //
    //     "Huyện Châu Thành, Ấp đông B, Xã Nhị Bình, tỉnh Tiền Giang/Trung Tâm đăng kiểm xe cơ giới 6303D - Tiền Giang"
    //   ]
    // },
    // {
    //   "state": "Trà Vinh",
    //   "districts": [
    //     "TX Trà Vinh - 151 Nguyễn Đáng - P.7 /Trung tâm đăng kiểm xe cơ giới 8401V - Trà Vinh",
    //
    //   ]
    // },
    // {
    //   "state": "Tuyên Quang",
    //   "districts": [
    //     "TP. Tuyên Quang-Thôn Yên Phú, xã An Tường /Trung Tâm đăng kiểm xe cơ giới 2201S - Tuyên Quang",
    //     "Huyện Yên Sơn- Thôn Lượng, xã Tứ Quận/Trung Tâm đăng kiểm xe cơ giới 2202D - Tuyên Quang"
    //   ]
    // },
    // {
    //   "state": "Vĩnh Long",
    //   "districts": [
    //
    //     "Phường - 10/2 Đinh Tiên Hoàng /Trung tâm đăng kiểm xe cơ giới 6401V - Vĩnh Long"
    //   ]
    // },
    // {
    //   "state": "Vĩnh Phúc",
    //   "districts": [
    //     "T.P Vĩnh Yên - Xã Khai Quang /Trung Tâm đăng kiểm xe cơ giới 8801S - Vĩnh Phúc",
    //     "Xã Đạo Đứ - Thôn Yên Lỗ / Trung Tâm đăng kiểm xe cơ giới 8802D - Vĩnh Phúc",
    //     "Huyện Yên Lạc-Xã Tam Hồng, tỉnh Vĩnh Phúc.phố Chợ Lầm/Trung Tâm đăng kiểm xe cơ giới 8803D -  trực thuộc công ty CP Hưng Linh Vĩnh Phúc.",
    //     "Huyện Tam Dương-Xã Hợp Thịnh-Km 40+500, Quốc lộ 2A/Trung Tâm đăng kiểm xe cơ giới 8804D",
    //
    //   ]
    // },
    // {
    //   "state": "Yên Bái",
    //   "districts": [
    //     "TP Yên Bái - Km2 - Phường Nguyễn Thái Học /Trung Tâm đăng kiểm xe cơ giới 2101S - Yên Bái",
    //     "Tỉnh Yên Bái-Bản Nà Làng, xã Nghĩa Lợi, TX. Nghĩa Lộ /Trung Tâm đăng kiểm xe cơ giới 2102D - Yên Bái"
    //   ]
    // }
    ];
}
