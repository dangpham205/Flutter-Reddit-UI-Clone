# midterm_519h0277

To run this project, first you need to run <b>'flutter pub get'<b> in your cmd to get the package then everything is good to go.

Vì em làm trên màn 6.3 inch nên nếu thầy chạy trên máy ~ 6.2-6.3 inch sẽ có tỉ lệ đúng với app thật ạ.

Các màn hình, chức năng đã làm: <br>
    -Màn Introduct: Hiển thị .gif làm background và 3 nút để người dùng login vào màn trang chủ.<br>
    -Màn Login: hiện thị form đăng nhập, nút đăng nhập chỉ có thể bấm (hiện màu) khi đã điền đủ 2 field.<br>
    -Màn Sign Up: hiện thị form đăng kí, nút đăng kí chỉ có thể bấm (hiện màu) khi đã điền đủ các field.<br>
    -Màn Home: hiển thị các bài viết theo dạng post card, gồm 2 tab. <br>
    -Màn Explore: hiển thị các bài post theo dạng gridview bằng thư viện StaggeredGridView, từng post sẽ hiển theo custom stack (hình, fadeout container, title), custom category menu để đi tới các bài post theo chủ đề <br>
    -Màn Upload: màn đăng bài viết, nút POST chỉ có thể bấm khi đã nhập nội dung bài viết <br>
    -Màn Chat: Hiển thị các chat box của những người đã từng nhắn tin, khung search dẫn đến màn search tìm người dùng để chat <br>
    -Màn New Chat: Hiện khi bấm vào biểu tưởng chat ở app bar màn Chat, hiển thị custom container chứa link mời người khác chat với mình và khung search để tìm kiếm người chat<br>
    -Màn Chatbox: Hiện chi tiết tin nhắn với các user khác, hiển thị avatar người dùng, thông tin của người dùng, khung chat fixed ở cuối màn hình.<br>
    -Màn Notification: Hiển thị các thông báo dẫn đến các bài viết mới, được lọc theo thời gian, và các chat message của các Bots welcome to channel <br>
    -Tab Home trong màn Home: hiện các bài post của các channel đã tham gia, các bài viết được bạn bè share <br>
    -Tab Popular trong màn Home: hiện các bài post hot của các channel chưa tham gia <br>
    -Tab Notification trong màn Notification: hiển thị các thông báo dẫn đến các bài viết mới, được lọc theo thời gian<br>
    -Tab Messages trong màn Notification: hiển thị các tin nhắn được gửi bởi các Bots theo dạng card, hiển thị được status tin nhắn đã được đọc chưa <br>
    -Màn Message Detail: Hiện khi bấm vào các tin nhắn của Bots, hiển thị chi tiết tin nhắn của các Bots, khung reply tin nhắn fixed ở cuối screen.<br>
    -Màn Channel: hiển thị khi bấm vào tên chanel ở các bài post hoặc trong mục My Channel trong start drawer.<br>
                Có sliver app bar (app bar mở rộng) hiển thị ảnh bìa, avatar, name... các thông tin của channel.<br>
    -Tab Post ở màn Channel: Hiện các post của channel, nếu không có sẽ hiển thông tin rằng chưa có post.<br>
    -Tab About ở màn Channel: Hiện các thông tin của channel (description, listview hiện các channel tương tự, listview hiện các founder).<br>
    -Tab Menu ở màn Channel: Hiện các hành động có thể làm ở Channel (Thoát channel...).<br>
    -Màn Create Community: Hiện khi bấm vào ở start/end drawer, có form để tạo channel, switch có thể lắng nghe sự kiện, nút CREATE chỉ có thể bấm khi đã điền đủ thông tin.<br>
    -Màn Image Category: Hiện khi bấm vào các category ở màn Explore, hiển thị các bài post có chung chủ để theo dạng gridview bằng thư viện StaggeredGridView, từng post sẽ hiển theo custom stack (hình, fadeout container, title).<br>
    -Màn Post Detail: Hiện khi bấm vào bài post hiển thị theo dạng card hoặc stack trong màn Home, Search, Explore, Profile, hiển thị các thông tin về post giống post card, và các comment của bài viết theo dạng card sau phần thông tin, và khung comment fixed ở cuối màn hình, phía trên, có thể lắng nghe action ấn Like, khung comment là stack của các user hiện đang có mặt trong bài post, avatar của họ sẽ stack đè lên nhau và có bộ đếm hiện tại bao nhiêu người đang hoạt động trong bài post <br>
    -Màn Profile: Hiện khi bấm vào tên người dùng trên các bài post, màn Search hoặc My Profile ở end drawer<br>
                Có sliver app bar (app bar mở rộng) hiển thị ảnh bìa, avatar, name... các thông tin của user.<br>
    -Tab Post của màn Profile: Hiện các bài viết của người dùng theo dạng card, nếu không có bài viết nào sẽ hiện thông tin đầy đủ.<br>
                Load mẫu trong My Profile sẽ có các bài post<br>
    -Tab Comment của màn Profile: Hiện các comment của người dùng theo dạng card, nếu không có comment nào sẽ hiện thông tin đầy đủ.<br>
    -Tab About của màn Profile: Hiện các tóm tắt, thông tin về người dùng theo dạng grid<br>
    -Màn Settings: Hiện khi bấm vào settings ở end drawer, có các option để thay đổi cài đặt của app, các switch trong màn này đều có thể lắng nghe action, thay đổi state khi bấm vào, từng option sẽ có từng dialog riêng biệt, được hiện ở custom position là ở cuối màn hình, fade in/ fade out từ dưới lên<br>
    -Màn Search: Hiện khi bấm vào các khung search, hiện thị các user được tìm kiếm gần đây, và các bài Post hot ở dưới theo dạng custom card, có thể search user thật và bấm vào các user để đi tới trang profile của họ<br>
    -Widget:<br>
        +Comment Card: Hiện các comment theo dạng card<br>
        +Dialog: từng dialog trong app đều là custom dialog, được hiện ở custom position là ở cuối màn hình, fade in/ fade out từ dưới lên<br>
        +End drawer: được mở bằng custom icon là avatar của người dùng ở cuối app bar, hiện các UI về thông tin người dùng, và option logout, đi đến các màn MyProfile, Settings, Create Community<br>
        +Post Card: hiển thị các post theo dạng card ở các màn Home, Profile, Channel, khi bấm vào tên User, sẽ có 1 custom dialog fade in/ fade out theo hướng trái sang phải, hiển thị avatar người dùng, option đi đến màn chat riêng với người dùng đó, đi đến profile người đó<br>
        +Start drawer: có các channel hiện đang join, option đi đến Create Community screen<br>
        ....... (và các widgets khác)<br>
