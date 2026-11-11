# Kịch bản quay demo.mp4 (TechHaven)

Yêu cầu của đề: video quay màn hình **tối thiểu 1080p**, **có tiếng rõ ràng**, trình bày **TẤT CẢ** tính năng theo bảng tự đánh giá, **không giảng lý thuyết**.
Gợi ý: OBS Studio, độ phân giải 1920×1080, 30 fps. Trước khi quay chạy `docker compose down -v` rồi `docker compose up -d` để có dữ liệu sạch, mở sẵn các tab:
`http://localhost:8080`, `http://localhost:8080/admin`, `http://localhost:8025` (hộp thư), `http://localhost:15672` (RabbitMQ).

Thứ tự bám theo rubric (thời lượng gợi ý ~15-18 phút):

| # | Cảnh | Thao tác | Rubric |
|---|------|----------|--------|
| 1 | Khởi động | Mở terminal, chạy `docker compose up -d`, `docker compose ps` (16 container) | Deployment |
| 2 | Trang chủ | Banner, Shop by need, Hot Deals, New Products, Best Sellers, các mục danh mục; bấm số trang ở 1 mục | 8, 10 |
| 3 | Danh mục | Vào Laptops: grid ↔ list, phân trang (bấm trang 2, trang cuối) | 9, 10 |
| 4 | Sắp xếp | Tên A-Z, Z-A, giá tăng/giảm, mới nhất, bán chạy | 16 |
| 5 | Lọc | Chọn 2 hãng, nhập giá min/max, chọn 4★, In stock, On sale, tag | 15 |
| 6 | Tìm kiếm | Gõ "cors" thấy gợi ý; tìm "samsng" (sai chính tả) vẫn ra Samsung | 14, Bonus ElasticSearch |
| 7 | Chi tiết SP | Tên, giá, giá gốc gạch, hãng, Overview ≥5 dòng, 4 ảnh + phóng to, chọn biến thể (giá/tồn kho đổi) | 11, 12 |
| 8 | Bình luận realtime | Mở 2 cửa sổ cùng sản phẩm; cửa sổ 1 (khách) bình luận → cửa sổ 2 hiện ngay; nhãn cảm xúc AI xuất hiện | 22, realtime, Bonus AI |
| 9 | Đánh giá sao | Khách bấm sao → yêu cầu đăng nhập; đăng nhập customer → chấm sao | 23 |
| 10 | Giỏ hàng | Thêm 2 SP (mini-cart), đổi số lượng/xóa → tổng, VAT, phí ship cập nhật không reload | 17, 18 |
| 11 | Mã giảm giá | Nhập mã sai → báo lỗi; nhập NEW26 → thấy số tiền giảm trước khi thanh toán | 20 |
| 12 | Thanh toán khách | Đăng xuất; checkout 3 bước bằng email mới, thẻ 4242…; màn hình thành công | 19 |
| 13 | Email | Mở Mailpit: email xác nhận đơn + link đặt mật khẩu (tài khoản tự tạo) | 21 |
| 14 | Tài khoản tự tạo | Bấm link đặt mật khẩu → đăng nhập → thấy đơn vừa mua trong lịch sử | 6, 7 |
| 15 | Đăng ký | Form chỉ có email, họ tên, địa chỉ; email đặt mật khẩu trong Mailpit | User registration |
| 16 | Google | Bấm "Continue with Google" (cần GOOGLE_CLIENT_ID trong .env) | 1 |
| 17 | Hồ sơ | Sửa tên/SĐT, đổi mật khẩu, thêm/sửa/xóa/đặt mặc định nhiều địa chỉ | 2, 3, 5 |
| 18 | Quên mật khẩu | Forgot password → email reset trong Mailpit → đặt mật khẩu mới | 4 |
| 19 | Checkout khi đăng nhập | Địa chỉ mặc định điền sẵn, đổi sang địa chỉ khác, dùng điểm tích lũy | Landing rule, 24 |
| 20 | Theo dõi đơn | My orders → chi tiết: bảng lịch sử trạng thái mới nhất ở trên; trang Track order cho khách | 6, 7 |
| 21 | Trợ lý AI | Bong bóng chat (Gemini trả lời): "Tư vấn laptop gaming dưới 30 triệu" → hỏi tiếp "Có mẫu nào rẻ hơn không?" (giữ ngữ cảnh), "Do you have an RTX 4070?" (trả lời tiếng Anh), "Phí giao hàng?" | Bonus AI |
| 22 | Yêu thích, so sánh | Thả tim, so sánh 3 laptop (bật "Show differences only") | UI/UX |
| 23 | Admin dashboard | Đăng nhập admin: Overview (users, new users, orders, revenue, best sellers, Needs attention) | 27 |
| 24 | Advanced dashboard | Yearly (mặc định) → Quarterly → Monthly → Weekly → Custom range | 28 |
| 25 | Quản lý SP | Tạo SP mới: biến thể, giá gốc, tồn kho; upload/kéo-thả 1-10 ảnh, đổi ảnh bìa; sửa; xóa; danh mục | 25 |
| 26 | Quản lý user | Xem, sửa thông tin, ban → user đó không đăng nhập được, unban | 26 |
| 27 | Quản lý đơn | Danh sách 20/trang, lọc today/yesterday/this week/this month/range; chi tiết; đổi trạng thái → khách nhận email + cập nhật realtime | 29, 30 |
| 28 | Mã giảm giá | Danh sách (thời gian tạo, giá trị, đã dùng/giới hạn, đơn đã áp dụng); tạo mã 5 ký tự, giới hạn ≤10 | 31 |
| 29 | Responsive | DevTools → iPhone / iPad: trang chủ, chi tiết, giỏ hàng, admin | 34 |
| 30 | Horizontal scaling | `docker compose up -d --scale api=5`, `node tests/scale-demo.mjs 100` (5 replica), dừng 1 replica vẫn chạy | 35 |
| 31 | Microservices | RabbitMQ UI (queues), dừng `search` → tìm kiếm vẫn chạy (fallback), dừng `assistant` → shop vẫn chạy | Bonus |
| 32 | CI/CD | GitHub → tab Actions: lần chạy xanh của workflow CI | Bonus |
