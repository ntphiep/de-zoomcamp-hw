# Introduction


## Data Modeling
Source:
- https://blog.tomorrowmarketers.org/star-schema-la-gi/
- https://blog.tomorrowmarketers.org/data-modeling-la-gi/

1. **Fact** table
- Bảng fact (Fact tables) chứa dữ liệu của các quan sát hoặc các sự kiện: số lượng đơn hàng, số lượng sản phẩm, giá bán, thời gian giao dịch và số lượng giao dịch. Bảng fact có thể chứa các giá trị lặp lại. 

> Ví dụ, một sản phẩm có thể xuất hiện ở nhiều dòng, thể hiện sản phẩm được các khách hàng khác nhau mua ở thời điểm khác nhau. Các giá trị này có thể được tổng hợp lại để tạo các biểu đồ (visual). Ví dụ, biểu đồ mô tả tổng đơn hàng sẽ là biểu đồ tồng hợp từ dữ liệu trong bảng fact. Ở bảng fact, bạn sẽ thường thấy các cột gồm các số và các ngày. Các con số đó có thể là một đơn vị, kết quả đo lường, như số lượng bán hàng, hoặc có thể là khóa (key), như ID khách hàng. Ngày tháng được ghi nhận trong bảng có thể là ngày bán, hoặc ngày giao hàng. 


2. **Dim** table
- Bảng dim (Dimension tables) chứa các chi tiết về dữ liệu trong bảng fact: thông tin sản phẩm, địa điểm, người bán, và loại đơn hàng, Các bảng này sẽ được nối đến các bảng fact thông qua cột khóa (key column). Bảng dim được sử dụng để lọc và nhóm bảng fact.
> Bảng Dim chứa các giá trị là duy nhất, chẳng hạn, mỗi dòng trong bảng Product thể hiện một sản phẩm duy nhất và mỗi dòng riêng biệt trong bảng Customer thể hiện một khách hàng duy nhất. Đối với biểu đồ tổng sales, bạn có thể nhóm dữ liệu để quan sát tổng sales chia theo sản phẩm, trong đó cột sản phẩm (product) nằm trong bảng dim. 

3. Tong hop
Bảng Fact thường lớn hơn bảng Dim vì bảng fact chứa rất nhiều sự kiện, ví dụ như chứa rất nhiều đơn hàng riêng biệt. Bảng Dim thì thường nhỏ hơn bởi vì thông thường bạn cần giới hạn số lượng các mục mà bạn có thể filter (lọc) và group (nhóm lại). Ví dụ, một năm chỉ bao gồm 12 tháng, hay nước Mỹ cũng chỉ có một số lượng bang nhất định.  


## Star Schema vs Snowflake Schema
| Star Schema | Snowflake Schema |
| --- | ----------- |
| Các đối tượng phụ xung quanh đối tượng chính sẽ được xây dựng chung một bảng dimension. | Các đối tượng phụ và đối tượng chính được xây dựng tách bạch. |
| Các bảng dimension được xây dựng xung quanh một bảng fact. | Với bảng fact là trung tâm, các bảng đối tượng được xây xung quanh, đồng thời còn các đối tượng phụ xung quanh đối tượng chính. |
| Star schema chỉ cần một câu lệnh `JOIN` để trả về dữ liệu giữa bảng fact và các bảng dimension. | Snowflake schema cần nhiều câu lệnh `JOIN` để xây dựng dữ liệu trả về |
| Thiết kế cơ sở dữ liệu đơn giản. | Thiết kế cơ sơ dữ liệu tương đối phức tạp. |
| Các đối tượng dữ liệu được dàn trải hàng ngang nên truy xuất nhanh hơn. | Các dữ liệu đối tượng được chuẩn hóa đúng theo đối tượng đó. |
| Các dữ liệu bị lặp lại khá nhiều. | Dữ liệu lặp lại ít hoặc không có. |
| Một đối tượng chính sẽ được tổng hợp từ nhiều đối tượng phụ vào chung một bảng. | Đối tượng chính được tách ra thêm các đối tượng phụ xung quanh. |


## dbt (Data Build Tools)
