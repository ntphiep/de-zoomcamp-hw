# Introduction

This course use Google BigQuery as a Data Warehouse.


## Data Warehouse

Data warehouse (DW) là một cơ sở dữ liệu quan hệ được thiết kế để truy vấn và phân tích hơn là xử lý giao dịch. Nó bao gồm dữ liệu lịch sử thu được từ dữ liệu giao dịch từ một nguồn và nhiều nguồn.

DW cung cấp dữ liệu lịch sử được tích hợp trên toàn doanh nghiệp và tập trung vào việc cung cấp hỗ trợ cho những người ra quyết định trong việc lập mô hình và phân tích dữ liệu.

DW là một nhóm dữ liệu cụ thể cho toàn bộ tổ chức, không chỉ cho một nhóm người dùng cụ thể.

Nó không được sử dụng cho các hoạt động hàng ngày và xử lý giao dịch nhưng được sử dụng để đưa ra quyết định.

DW có thể được xem như một hệ thống dữ liệu với các thuộc tính sau:

Nó là một cơ sở dữ liệu được thiết kế cho các nhiệm vụ điều tra, sử dụng dữ liệu từ các ứng dụng khác nhau. Nó hỗ trợ một số lượng tương đối nhỏ khách hàng với các tương tác tương đối dài. Nó bao gồm dữ liệu hiện tại và lịch sử để cung cấp một quan điểm lịch sử của thông tin. Việc sử dụng nó là đọc chuyên sâu. Nó chứa một vài bảng lớn. DW là một kho lưu trữ thông tin theo hướng chủ đề, tích hợp và biến thể theo thời gian để hỗ trợ các quyết định của ban quản lý.”


### Đặc điểm của Data warehouse:
- **Subject-Oriented**: Mục tiêu DW về mô hình hóa và phân tích dữ liệu cho những người ra quyết định. Do đó, thường cung cấp một cái nhìn ngắn gọn và dễ hiểu về một chủ đề cụ thể, chẳng hạn như khách hàng, sản phẩm hoặc bán hàng, thay vì các hoạt động liên tục của tổ chức toàn cầu. Điều này được thực hiện bằng cách loại trừ dữ liệu không hữu ích liên quan đến chủ đề và bao gồm tất cả dữ liệu mà người dùng cần để hiểu chủ đề.
- **Integrated** Data warehouse tích hợp nhiều nguồn dữ liệu không đồng nhất khác nhau như RDBMS, tệp phẳng và hồ sơ giao dịch trực tuyến. Nó yêu cầu thực hiện làm sạch và tích hợp dữ liệu trước khi lưu trữ dữ liệu để đồng bộ về mặt đặt tên, loại thuộc tính, v.v. giữa các nguồn data tổng.
- **Time-Variant** Thông tin lịch sử được lưu giữ trong Data warehouse. Ví dụ, người ta có thể truy xuất các tệp từ 3 tháng, 6 tháng, 12 tháng, hoặc thậm chí dữ liệu trước đó từ một Data warehouse. Các biến thể này với hệ thống giao dịch, nơi thường chỉ lưu trữ tệp mới nhất.
- **Non-Volatile** Data warehouse là nơi lưu trữ dữ liệu riêng biệt về mặt vật lý, được chuyển đổi từ RDBMS hoạt động nguồn. Các cập nhật hoạt động của dữ liệu không xảy ra trong Data warehouse, tức là các hoạt động cập nhật, chèn và xóa không được thực hiện. Nó thường chỉ yêu cầu hai thủ tục trong truy cập dữ liệu: Tải dữ liệu ban đầu và truy cập dữ liệu. Do đó, DW không yêu cầu khả năng xử lý giao dịch, khôi phục và đồng thời, cho phép tăng tốc đáng kể việc truy xuất dữ liệu. Non-Volatile định nghĩa rằng một khi đã được nhập vào kho và dữ liệu không được thay đổi.


### Mục tiêu của Data warehouse
1. Để giúp báo cáo cũng như phân tích
2. Duy trì thông tin lịch sử của tổ chức
3. Làm nền tảng cho việc ra quyết định.



## OLTP vs OLAP

### **vi**
![alt text](imgs/image.png)


### **en**
![alt text](imgs/image-1.png)
![alt text](imgs/image-2.png)


> Hoạt động chủ yếu trong các các hệ thống OLAP là các truy vấn dữ liệu, Chúng thường là các truy vấn lớn và mất nhiều thời gian để thực hiện. Ngược lại, các hệ thống OLTP sử dụng các lệnh phổ biến như INSERT và DELETE. Và chúng không nên quá lâu.

> Kích thước của hệ thống cũng là một điểm khác nhau cơ bản giữa các hệ thống OLTP và OLAP. OLTP phải ổn định và nhanh chóng (để thực hiện các công việc thời gian thực), trong khi OLAP phải đủ lớn và đủ mạnh để lưu trữ tất cả các dữ liệu kinh doanh.


## Google BigQuery

####  Notes
- [Sides](https://docs.google.com/presentation/d/1a3ZoBAXFk8-EhUsd7rAZd-5p_HpltkzSeujjRGB2TAI/edit?usp=sharing)


  




### Structure Internal 
![alt text](imgs/image-3.png)



### BigQuery-Best Practice
- Cost reduction
  - Avoid SELECT *
  - Price your queries before running them
  - Use clustered or partitioned tables
  - Materialize query results in stages

- Query Performance
  - Filter on partitioned columns
  - Denormalizing data
  - Reduce data before using a JOIN
  - Do not treat WITH clauses as prepared statement
  - Order Last, for query operations to maximize performance
  - [**JOIN**] As a best practice, place the table with the largest number of rows first, followed by the table with the fewest rows, and then place the remaining tables by decreasing size.
  
### ML in BigQuery
- No need to export data into a different system
- Free
  - 10 GB per month of data storage
  - 1 TB per month of queries processed
  
![alt text](imgs/image-4.png)

### Example

![alt text](image.png)

- [From GCP](https://cloud.google.com/bigquery/docs/export-model-tutorial)