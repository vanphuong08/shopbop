USE [aspnet12_project]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/3/2020 9:20:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parent_id] [int] NULL,
	[name] [nvarchar](500) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11/3/2020 9:20:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[phone] [nvarchar](500) NULL,
	[address] [nvarchar](500) NULL,
	[email] [nvarchar](500) NULL,
	[password] [nvarchar](500) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 11/3/2020 9:20:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[content] [ntext] NULL,
	[hot] [int] NULL,
	[photo] [nvarchar](max) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/3/2020 9:20:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_OrdersDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/3/2020 9:20:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[date] [date] NULL,
	[price] [float] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/3/2020 9:20:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[name] [nvarchar](500) NULL,
	[description] [ntext] NULL,
	[content] [ntext] NULL,
	[hot] [int] NULL,
	[photo] [nvarchar](500) NULL,
	[price] [float] NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsImages]    Script Date: 11/3/2020 9:20:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsImages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[photo] [nvarchar](500) NULL,
 CONSTRAINT [PK_ProductsImages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 11/3/2020 9:20:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[star] [int] NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/3/2020 9:20:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](400) NULL,
	[email] [nvarchar](400) NULL,
	[password] [nvarchar](400) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [parent_id], [name]) VALUES (1, 0, N'IPhone')
INSERT [dbo].[Categories] ([id], [parent_id], [name]) VALUES (2, 0, N'LG')
INSERT [dbo].[Categories] ([id], [parent_id], [name]) VALUES (3, 8, N'Samsung Galaxy')
INSERT [dbo].[Categories] ([id], [parent_id], [name]) VALUES (4, 1, N'IPhone XS')
INSERT [dbo].[Categories] ([id], [parent_id], [name]) VALUES (5, 1, N'IPhone XS Max')
INSERT [dbo].[Categories] ([id], [parent_id], [name]) VALUES (6, 2, N'LG A93')
INSERT [dbo].[Categories] ([id], [parent_id], [name]) VALUES (7, 2, N'LG A95')
INSERT [dbo].[Categories] ([id], [parent_id], [name]) VALUES (8, 0, N'Samsung')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([id], [name], [phone], [address], [email], [password]) VALUES (1, N'Nguyễn Văn A', N'12345678', N'Hà Nội', N'nva@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3')
INSERT [dbo].[Customers] ([id], [name], [phone], [address], [email], [password]) VALUES (2, N'Nguyễn Văn B', N'12345678', N'Hà Nội', N'nvb@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([id], [name], [description], [content], [hot], [photo]) VALUES (1, N'Vespa ra mắt Sprint 150 phiên bản đặc biệt dành riêng cho Thái Lan', N'<p>Vespa vừa tung ra chiếc Sprint 150 phi&ecirc;n bản đặc biệt d&agrave;nh ri&ecirc;ng cho thị trường Th&aacute;i Lan mang t&ecirc;n Sprint 150 i-Get ABS 10th Anniversary Thailand Limited Edition (gọi tắt l&agrave; Sprint 10th Anniversary). Đ&uacute;ng như t&ecirc;n gọi, chiếc Sprint 150 n&agrave;y l&agrave; phi&ecirc;n bản kỷ niệm sinh nhật lần thứ 10 của Vespa Th&aacute;i Lan.</p>', N'<p>Vespa vừa tung ra chiếc Sprint 150 phi&ecirc;n bản đặc biệt d&agrave;nh ri&ecirc;ng cho thị trường Th&aacute;i Lan mang t&ecirc;n Sprint 150 i-Get ABS 10th Anniversary Thailand Limited Edition (gọi tắt l&agrave; Sprint 10th Anniversary). Đ&uacute;ng như t&ecirc;n gọi, chiếc Sprint 150 n&agrave;y l&agrave; phi&ecirc;n bản kỷ niệm sinh nhật lần thứ 10 của Vespa Th&aacute;i Lan.</p>

<p><img alt="Vespa ra mắt Sprint 150 phiên bản đặc biệt dành riêng cho Thái Lan - 1" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/vespa-sprint-1.jpg" title="Vespa ra mắt Sprint 150 phiên bản đặc biệt dành riêng cho Thái Lan - 1" /></p>

<p>L&agrave; phi&ecirc;n bản đặc biệt, Vespa Sprint 10th Anniversary được sản xuất với số lượng giới hạn - 1.010 xe. Mẫu xe đặc biệt n&agrave;y c&oacute; gi&aacute; ni&ecirc;m yết khoảng 4.800 USD, đắt hơn 900 USD so với Vespa Sprint 150 ti&ecirc;u chuẩn.</p>

<p><img alt="Vespa ra mắt Sprint 150 phiên bản đặc biệt dành riêng cho Thái Lan - 2" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/vespa-sprint-2.jpg" title="Vespa ra mắt Sprint 150 phiên bản đặc biệt dành riêng cho Thái Lan - 2" /></p>

<p>Sprint 10th Anniversary được ho&agrave;n thiện trong m&agrave;u sơn bạc Grigio Seta, lấy cảm hứng từ tấm poster Vespa 1st. Bạc cũng l&agrave; m&agrave;u biểu tượng của Vespa, được sử dụng xuy&ecirc;n suốt từ những mẫu xe đầu ti&ecirc;n đến tận ng&agrave;y nay.</p>

<p><img alt="Vespa ra mắt Sprint 150 phiên bản đặc biệt dành riêng cho Thái Lan - 3" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/vespa-sprint-3.jpg" title="Vespa ra mắt Sprint 150 phiên bản đặc biệt dành riêng cho Thái Lan - 3" /></p>

<p>Y&ecirc;n xe được bọc da m&agrave;u x&aacute;m với đường chỉ kh&acirc;u họa tiết kim cương. Để tạo điểm nhấn, Vespa đ&atilde; th&ecirc;m c&aacute;c chi tiết m&agrave;u đồng như viền th&acirc;n xe, chụp đ&egrave;n trước, che đồng hồ, tay dắt ph&iacute;a sau v&agrave; cặp m&acirc;m.</p>

<p><img alt="Vespa ra mắt Sprint 150 phiên bản đặc biệt dành riêng cho Thái Lan - 4" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/vespa-sprint-4.jpg" title="Vespa ra mắt Sprint 150 phiên bản đặc biệt dành riêng cho Thái Lan - 4" /></p>

<p>Tương tự c&aacute;c phi&ecirc;n bản đặc biệt kh&aacute;c, Vespa Sprint 10th Anniversary c&oacute; huy hiệu đ&aacute;nh số thứ tự ở nắp hộc đựng đồ ph&iacute;a trước.</p>

<p><img alt="Vespa ra mắt Sprint 150 phiên bản đặc biệt dành riêng cho Thái Lan - 5" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/vespa-sprint-5.jpg" title="Vespa ra mắt Sprint 150 phiên bản đặc biệt dành riêng cho Thái Lan - 5" /></p>

<p>Phi&ecirc;n bản đặc biệt n&agrave;y được bổ sung k&iacute;nh chắn gi&oacute; nhỏ ph&iacute;a trước, gợi nhớ về những mẫu xe trong qu&aacute; khứ.</p>

<p><img alt="Vespa ra mắt Sprint 150 phiên bản đặc biệt dành riêng cho Thái Lan - 6" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/vespa-sprint-6.jpg" title="Vespa ra mắt Sprint 150 phiên bản đặc biệt dành riêng cho Thái Lan - 6" /></p>

<p>Khi mua Vespa Sprint 10th Anniversary, kh&aacute;ch h&agrave;ng sẽ nhận được loạt qu&agrave; tặng gồm sổ lưu niệm, bộ bưu thiếp, sticker, mũ 3/4, găng tay, t&uacute;i trước bằng da, t&uacute;i mua sắm... Tất cả đều c&oacute; m&agrave;u bạc hoặc đồng, c&ugrave;ng tone với xe.</p>

<p><img alt="Vespa ra mắt Sprint 150 phiên bản đặc biệt dành riêng cho Thái Lan - 7" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/vespa-sprint-7.jpg" title="Vespa ra mắt Sprint 150 phiên bản đặc biệt dành riêng cho Thái Lan - 7" /></p>

<p>C&ograve;n lại, Vespa Sprint 10th Anniversary vẫn giống Sprint 150 ti&ecirc;u chuẩn. C&aacute;c th&ocirc;ng số cơ bản của xe gồm d&agrave;i 1.863 mm, rộng 695 mm chiều d&agrave;i cơ sở 1.334 mm v&agrave; chiều cao y&ecirc;n 790 mm.</p>

<p><img alt="Vespa ra mắt Sprint 150 phiên bản đặc biệt dành riêng cho Thái Lan - 8" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/vespa-sprint-8.jpg" title="Vespa ra mắt Sprint 150 phiên bản đặc biệt dành riêng cho Thái Lan - 8" /></p>

<p>Xe được trang bị động cơ iGet 150 cc cho c&ocirc;ng suất tối đa 12,3 m&atilde; lực v&agrave; m&ocirc;-men xoắn 12,2 Nm. C&aacute;c trang bị đ&aacute;ng ch&uacute; &yacute; tr&ecirc;n xe như phanh ABS, đ&egrave;n chiếu s&aacute;ng LED, cổng sạc USB v&agrave; cặp m&acirc;m đa chấu.</p>', 1, N'Vespa-Sprint-9.jpg')
INSERT [dbo].[News] ([id], [name], [description], [content], [hot], [photo]) VALUES (2, N'Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ', N'<p>Nếu như Cadillac Escalade 2021 vượt qu&aacute; ng&acirc;n s&aacute;ch hay sở th&iacute;ch của bạn, th&igrave; một chiếc Mercedes-Maybach GLS 600 4MATIC mới chắc hẳn sẽ ph&ugrave; hợp hơn.</p>', N'<p>C&oacute; gi&aacute; b&aacute;n khởi điểm từ 160.500 USD (~ 3,7 tỷ VNĐ) chưa gồm ph&iacute; giao h&agrave;ng 1.050 USD (~ 24,3 triệu VNĐ), Mercedes-Maybach GLS hứa hẹn sẽ mẫu SUV sang trọng bậc nhất của thương hiệu ng&ocirc;i sao ba c&aacute;nh.</p>

<p><img alt="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 1" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/mercedes-maybach-gls-1.jpg" title="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 1" /></p>

<p>Về ngoại thất, Mercedes-Maybach GLS 2021 được trang bị lưới tản nhiệt độc đ&aacute;o mới, c&ugrave;ng biểu tượng ng&ocirc;i sao ba c&aacute;nh tr&ecirc;n mui xe - đặc trưng của những chiếc Maybach. Ngo&agrave;i ra, xe c&ograve;n c&oacute; nhiều chi tiết trang tr&iacute; mạ cr&ocirc;m quanh th&acirc;n, bậc l&ecirc;n xuống chỉnh điện c&oacute; thể thu lại v&agrave; la-zăng 22 inch. Kh&aacute;ch h&agrave;ng cũng c&oacute; c&aacute;c lựa chọn sơn ngoại thất hai t&ocirc;ng v&agrave; c&aacute;c b&aacute;nh xe hợp kim 23 inch để tăng th&ecirc;m t&iacute;nh độc quyền cho &quot;xế y&ecirc;u&quot;.</p>

<p><img alt="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 2" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/mercedes-maybach-gls-2.jpg" title="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 2" /></p>

<p>Tuy nhi&ecirc;n, điểm đ&aacute;ng ch&uacute; &yacute; nhất của Maybach GLS mới nằm ở kh&ocirc;ng gian cabin 4 chỗ, đặc biệt l&agrave; hai chiếc ghế sau được ngăn c&aacute;ch bởi cụm điều khiển trung t&acirc;m t&iacute;ch hợp c&aacute;c điều chỉnh cho chức năng sưởi, th&ocirc;ng gi&oacute; v&agrave; massage của ghế. Bảng điều khiển cũng chứa một b&agrave;n gấp để biến khoang sau xe th&agrave;nh một văn ph&ograve;ng di động.</p>

<p><a href="https://urekamedia.com/" target="_blank"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAAAvCAYAAACmGYWkAAAACXBIWXMAAAsTAAALEwEAmpwYAAAFIGlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxNDUgNzkuMTYzNDk5LCAyMDE4LzA4LzEzLTE2OjQwOjIyICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxOSAoTWFjaW50b3NoKSIgeG1wOkNyZWF0ZURhdGU9IjIwMjAtMDktMjNUMTQ6MDE6MTMrMDc6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDIwLTA5LTIzVDE0OjA3OjE1KzA3OjAwIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDIwLTA5LTIzVDE0OjA3OjE1KzA3OjAwIiBkYzpmb3JtYXQ9ImltYWdlL3BuZyIgcGhvdG9zaG9wOkNvbG9yTW9kZT0iMyIgcGhvdG9zaG9wOklDQ1Byb2ZpbGU9InNSR0IgSUVDNjE5NjYtMi4xIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjg0Yzk4MWQyLWQ2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" /></a></p>

<p><iframe scrolling="no"></iframe>X</p>

<p><img alt="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 3" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/mercedes-maybach-gls-3.jpg" title="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 3" /></p>

<p>Đ&oacute; vẫn chỉ l&agrave; &quot;phần nổi của tảng băng ch&igrave;m&quot;, Mercedes-Maybach GLS thậm ch&iacute; c&oacute; cả ngăn l&agrave;m lạnh v&agrave; l&agrave;m n&oacute;ng đồ uống, khay đựng cốc cũng như bộ sạc kh&ocirc;ng d&acirc;y cho điện thoại th&ocirc;ng minh ở ph&iacute;a trước v&agrave; sau.</p>

<p><img alt="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 4" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/mercedes-maybach-gls-4.jpg" title="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 4" /></p>

<p>Những điểm nổi bật kh&aacute;c bao gồm m&aacute;y t&iacute;nh bảng 7 inch, hệ thống điều h&ograve;a nhiệt độ 4 v&ugrave;ng, kệ đựng đồ bằng gỗ ngăn c&aacute;ch nội thất với khoang h&agrave;nh l&yacute; rộng r&atilde;i, l&oacute;t trần bằng da Nappa, hệ thống tạo hương thơm Air Balance v&agrave; một ngăn lạnh t&ugrave;y chọn để tạo bọt. Đ&oacute; l&agrave; c&ograve;n chưa kể những trang bị &quot;truyền thống&quot; kh&aacute;c của Mercedes như hệ thống &acirc;m thanh v&ograve;m Burmester 3D v&agrave; hai m&agrave;n h&igrave;nh 12,3 inch.</p>

<p><img alt="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 5" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/mercedes-maybach-gls-5.jpg" title="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 5" /></p>

<p>Về truyền động, trong khi những chiếc Maybach kh&aacute;c thường đi k&egrave;m với động cơ V12, Maybach GLS 2021 lại sử dụng động cơ tăng &aacute;p k&eacute;p V8 4.0L sản sinh c&ocirc;ng suất 550 m&atilde; lực v&agrave; m&ocirc;-men xoắn cực đại 729Nm. Động cơ c&ograve;n được hỗ trợ th&ecirc;m bởi bộ khởi động điện EQ Boost bổ sung th&ecirc;m 21 m&atilde; lực v&agrave; 249Nm khi cần thiết. Maybach GLS c&oacute; thể tăng tốc từ 0 - 96 km/h chỉ trong 4,8 gi&acirc;y.</p>

<p><img alt="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 6" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/mercedes-maybach-gls-6.jpg" title="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 6" /></p>

<p>Ưu ti&ecirc;n h&agrave;ng đầu của mọi chiếc Maybach l&agrave; sự thoải m&aacute;i, v&igrave; vậy, Mercedes-Maybach GLS 2021 cũng được trang bị hệ thống treo E-Active Body Control gi&uacute;p qu&eacute;t đường ph&iacute;a trước để chủ động chống lại c&aacute;c va chạm v&agrave; điều chỉnh giảm x&oacute;c để c&oacute; một chuyến đi cực kỳ &ecirc;m &aacute;i. Xe c&oacute; chương tr&igrave;nh l&aacute;i Maybach Dynamic Select tập trung v&agrave;o sự thoải m&aacute;i của h&agrave;nh kh&aacute;ch ph&iacute;a sau bằng c&aacute;ch giảm thiểu độ lăn x&oacute;c của th&acirc;n xe.</p>

<p><img alt="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 7" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/mercedes-maybach-gls-7.jpg" title="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 7" /></p>

<p><img alt="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 8" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/mercedes-maybach-gls-8.jpg" title="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 8" /></p>

<p><img alt="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 9" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/mercedes-maybach-gls-9.jpg" title="Mercedes-Maybach GLS 600 4MATIC 2021 - SUV siêu sang có giá từ 3,7 tỷ VNĐ - 9" /></p>', 1, N'BMW-X8-concert.jpg')
INSERT [dbo].[News] ([id], [name], [description], [content], [hot], [photo]) VALUES (3, N'Hyundai Tucson đang rẻ hơn Honda CR-V cả trăm triệu đồng', N'<p>Nhằm đẩy mạnh doanh số dịp cuối năm, một số đại l&yacute; Hyundai tại Việt Nam đang giảm gi&aacute; mẫu xe Tucson từ 20 &ndash; 40 triệu đồng trong th&aacute;ng 10/2020, khiến mẫu xe n&agrave;y rẻ hơn Honda CR-V cả trăm triệu đồng.</p>', N'<p>Gi&aacute; xe Hyundai Tucson hiện đang được c&aacute;c đại l&yacute; giảm tiền mặt từ 20 &ndash; 40 triệu đồng so với ni&ecirc;m yết. Cụ thể, tại khu vực H&agrave; Nội, mẫu xe Hyundai Tucson phi&ecirc;n bản 2.0 MPI ti&ecirc;u chuẩn được giảm gi&aacute; 35 triệu đồng, xuống c&ograve;n 764 triệu đồng. Phi&ecirc;n bản 2.0 đặc biệt giảm 37 triệu đồng xuống c&ograve;n 841 triệu đồng, hai phi&ecirc;n bản 1.6 Đặc biệt v&agrave; 2.0 Dầu đặc biệt c&ugrave;ng giảm 38 triệu đồng xuống c&ograve;n lần lượt l&agrave; 894 v&agrave; 902 triệu đồng.</p>

<p>C&ograve;n tại khu vực TP.HCM, cả 3 phi&ecirc;n bản Hyundai Tucson giảm gi&aacute; mạnh cụ thể; bản 2.0 MPI ti&ecirc;u chuẩn; 2.0 MPI đặc biệt; 1.6 Đặc biệt c&oacute; mức giảm 20 triệu đồng tiền mặt, xuống c&ograve;n lần lượt l&agrave; 779; 858 v&agrave; 902 triệu đồng, ri&ecirc;ng bản 2.0 dầu đặc biệt giảm 40 triệu đồng xuống c&ograve;n 900 triệu đồng. Ngo&agrave;i ra kh&aacute;ch h&agrave;ng mua xe sẽ nhận được th&ecirc;m g&oacute;i khuyến mại phụ kiện trị gi&aacute; 15 triệu đồng bao gồm thảm trải s&agrave;n, d&aacute;n phim c&aacute;ch nhiệt v&agrave; camera h&agrave;nh tr&igrave;nh.</p>

<p><img alt="Hyundai Tucson đang rẻ hơn Honda CR-V cả trăm triệu đồng" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/hyundai-tucson.jpg" title="Hyundai Tucson đang rẻ hơn Honda CR-V cả trăm triệu đồng" /></p>

<p>Gi&aacute; xe Hyundai Tucson hiện đang được c&aacute;c đại l&yacute; giảm tiền mặt từ 20 &ndash; 40 triệu đồng so với ni&ecirc;m yết.&nbsp;</p>

<p>Với mức giảm gi&aacute; b&aacute;n đang được c&aacute;c đại l&yacute; &aacute;p dụng, Hyundai Tucson tại Việt Nam hiện đang l&agrave; mẫu xe c&oacute; gi&aacute; b&aacute;n cạnh tranh nhất ph&acirc;n kh&uacute;c, phi&ecirc;n bản cao nhất của TucSon rẻ hơn Honda CR-V L khoảng 218 triệu đồng, rẻ hơn Mazda CX-5 AWD l&agrave; 149 triệu đồng.</p>

<p>Kh&ocirc;ng những vậy, Tucson được TC Motor lắp r&aacute;p trong nước n&ecirc;n c&ograve;n được hưởng ch&iacute;nh s&aacute;ch giảm 50% lệ ph&iacute; trước bạ đến hết năm 2020 theo nội dung quy định tại Nghị định 70/NĐ-CP. Nhờ đ&oacute;, gi&aacute; lăn b&aacute;nh Tucson giảm từ 40 &ndash; 56 triệu đồng so với gi&aacute; b&aacute;n trước đ&oacute;.</p>

<p>Theo đ&oacute;, động th&aacute;i giảm gi&aacute; của Tucson được cho l&agrave; nhằm dọn kho, đ&oacute;n phi&ecirc;n bản 2021 về Việt Nam trong thời gian sắp tới. Hyundai Tucson thế hệ mới đ&atilde; được ra mắt tại thị trường H&agrave;n Quốc v&agrave;o giữa th&aacute;ng 9/2020 v&agrave; dự kiến sẽ về Việt Nam v&agrave;o đầu năm sau.</p>

<p>B&ecirc;n cạnh đ&oacute;, chương tr&igrave;nh giảm gi&aacute; n&agrave;y được &aacute;p dụng cũng nhằm tiếp tục duy tr&igrave; doanh số b&aacute;n h&agrave;ng đang tr&ecirc;n đ&agrave; tăng trưởng mạnh m&agrave; Hyundai Tucson đạt được trong th&aacute;ng 9 vừa qua.</p>

<p><img alt="Hyundai Tucson đang rẻ hơn Honda CR-V cả trăm triệu đồng - 1" src="https://img.docbao.vn/images/uploads/2020/10/20/video-anh/hyundai-tucson-1.jpg" title="Hyundai Tucson đang rẻ hơn Honda CR-V cả trăm triệu đồng - 1" /></p>

<p>&nbsp;Theo đ&oacute;, động th&aacute;i giảm gi&aacute; của Tucson được cho l&agrave; nhằm dọn kho, đ&oacute;n phi&ecirc;n bản 2021 về Việt Nam trong thời gian sắp tới.</p>

<p>Theo b&aacute;o c&aacute;o của Hiệp hội c&aacute;c Nh&agrave; sản xuất &ocirc;t&ocirc; Việt Nam (VAMA), trong th&aacute;ng 9/2020, Hyundai Tucson đ&atilde; c&oacute; bước tiến mạnh mẽ về mặt doanh số b&aacute;n h&agrave;ng với doanh số l&ecirc;n tới 1.671 xe, tăng 1.048 xe so với th&aacute;ng 8/2020. Th&agrave;nh t&iacute;ch n&agrave;y, gi&uacute;p Hyundai Tucson vượt mặt Mazda CX-5 để dẫn đầu cuộc đua doanh số ph&acirc;n kh&uacute;c xe crossover 5 chỗ trong th&aacute;ng 9/2020, đồng thời lần đầu ti&ecirc;n g&oacute;p mặt trong Top 3 mẫu &ocirc; t&ocirc; b&aacute;n chạy nhất Việt Nam theo th&aacute;ng.</p>

<p>Doanh số b&aacute;n Hyundai Tucson chỉ xếp sau Toyota Vios (2.912 xe) v&agrave; &ldquo;người anh em&rdquo; Hyundai Accent (1.871 xe). Mức tăng trưởng ấn tượng của Tucson trong th&aacute;ng 9/2020 một phần đến từ ch&iacute;nh s&aacute;ch ưu đ&atilde;i, giảm gi&aacute; b&aacute;n được c&aacute;c đại l&yacute; Hyundai &aacute;p dụng cho c&aacute;c phi&ecirc;n bản của mẫu xe n&agrave;y. T&iacute;nh tổng doanh số 9 th&aacute;ng đầu năm, Hyundai Tucson đ&atilde; b&aacute;n ra 6.682 xe, vượt qua Mazda CX-5 với 6.380 xe v&agrave; Honda CR-V với 5.736 xe.</p>', 1, N'Hyundai-Tucson-2.jpg')
INSERT [dbo].[News] ([id], [name], [description], [content], [hot], [photo]) VALUES (4, N'''Trùm cuối'' BMW X8 M ra mắt cuối năm sau, dùng động cơ V8 mạnh nhất lịch sử', N'<p>Đội h&igrave;nh BMW sẽ sớm c&oacute; th&ecirc;m SUV chủ lực X8 k&egrave;m với đ&oacute; l&agrave; phi&ecirc;n bản hiệu suất cao X8 M hứa hẹn l&agrave; d&ograve;ng xe mạnh nhất lịch sử thương hiệu xứ Bavaria.</p>', N'<p>Được kỳ vọng sẽ ra mắt v&agrave;o cuối năm sau v&agrave; mở b&aacute;n từ đầu 2022, X8 c&oacute; thể coi l&agrave; phi&ecirc;n bản thể thao, t&aacute;o bạo hơn của X7 7 chỗ. D&ugrave; ban đầu &yacute; định của thương hiệu xứ Bavaria cho X8 l&agrave; một phi&ecirc;n bản coupe h&oacute;a của X6 nhỏ hơn, những h&igrave;nh ảnh đầu ti&ecirc;n về d&ograve;ng SUV cỡ lớn cho thấy thiết kế xe m&agrave; cụ thể hơn l&agrave; phần trần vẫn cao, thẳng vu&ocirc;ng vắn d&ugrave; c&oacute; đ&ocirc;i ch&uacute;t thấp hơn X7.</p>

<p>Như vậy, X8 nhiều khả năng vẫn giữ được cấu h&igrave;nh 3 h&agrave;ng ghế (7 hoặc 6 chỗ ngồi tối đa). Một số điểm nhấn thiết kế kh&aacute;c của X8 l&agrave; mũi xe sắc sảo v&agrave; h&ocirc;ng xe rộng hơn nhiều trong khi nửa th&acirc;n tr&ecirc;n được thu gọn.</p>

<p><img alt="''Trùm cuối'' BMW X8 M ra mắt cuối năm sau, dùng động cơ V8 mạnh nhất lịch sử - 1" src="https://img.docbao.vn/images/uploads/2020/10/20/7-bmw-x8-front-watermarked-1603101603776265067287.jpg" title="''Trùm cuối'' BMW X8 M ra mắt cuối năm sau, dùng động cơ V8 mạnh nhất lịch sử - 1" /></p>

<p>Phần lớn nền tảng kỹ thuật của BMW X8 được cho l&agrave; chia sẻ chung với X7, đồng nghĩa với nhiều t&ugrave;y chọn động cơ cả xăng, dầu lẫn hybrid, trong đ&oacute; bản đỉnh cao c&oacute; thể l&agrave; d&ograve;ng X8 M50i d&ugrave;ng động cơ V8 4.4L tăng &aacute;p k&eacute;p 530 m&atilde; lực.</p>

<p>Tuy nhi&ecirc;n, kh&ocirc;ng như X7 chỉ dừng l&agrave; ở bản M50i, X8 rất c&oacute; thể sẽ c&oacute; phi&ecirc;n bản hiệu suất cao M ho&agrave;n chỉnh với động cơ hybrid sạc điện lấy tr&aacute;i tim l&agrave; động cơ V8 4.4L. C&ocirc;ng suất xe c&oacute; khả năng rất cao sẽ vượt ngưỡng 760 m&atilde; lực nhờ bổ sung th&ecirc;m m&ocirc; tơ điện 200 m&atilde; lực, biến đ&acirc;y th&agrave;nh d&ograve;ng t&ecirc;n BMW mạnh mẽ nhất trong lịch sử.</p>

<p>Dựa tr&ecirc;n việc gi&aacute; khởi điểm X7 M50i hiện tại đ&atilde; l&ecirc;n tới kh&ocirc;ng dưới 117.000 USD đồng nghĩa với việc để sở hữu X8 M, con số người d&ugrave;ng phải bỏ ra hứa hẹn kh&ocirc;ng c&aacute;ch mốc 150.000 USD l&agrave; mấy.</p>', 1, N'Mercedes-Maybach-GLS-600.jpg')
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [quantity], [price]) VALUES (5, 3, 30, 1, 7000000)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [quantity], [price]) VALUES (6, 3, 28, 1, 7000000)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [quantity], [price]) VALUES (7, 4, 27, 1, 10000000)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [quantity], [price]) VALUES (8, 4, 23, 1, 6000000)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [quantity], [price]) VALUES (9, 4, 24, 1, 7000000)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [customer_id], [date], [price], [status]) VALUES (3, 1, CAST(N'2020-11-03' AS Date), 14000000, 2)
INSERT [dbo].[Orders] ([id], [customer_id], [date], [price], [status]) VALUES (4, 1, CAST(N'2020-11-03' AS Date), 23000000, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [category_id], [name], [description], [content], [hot], [photo], [price], [discount]) VALUES (1, 1, N'IPhone 1', N'<p>Một đoạn video mới được đăng tải tr&ecirc;n mạng x&atilde; hội cho thấy nh&oacute;m qu&acirc;n nh&acirc;n Anh mặc bộ trang bị đặc biệt cho ph&eacute;p họ c&oacute; thể bay lượn như &ldquo;si&ecirc;u nh&acirc;n&rdquo; để thực hiện b&agrave;i diễn tập đổ bộ t&agrave;u chiến.</p>
', N'<p>Viện Hải qu&acirc;n Mỹ cuối tuần qua đ&atilde; đăng tải một đoạn video ghi lại cảnh đội &ldquo;người bay&rdquo; của hải qu&acirc;n Anh thực hiện c&aacute;c kỹ thuật m&agrave;&nbsp;<em>Sputnik</em>&nbsp;m&ocirc; tả l&agrave; &ldquo;giống từ một bộ phim h&agrave;nh động&rdquo;.</p>

<p>Trong đoạn video, c&aacute;c binh sĩ đ&atilde; diễn tập chiếm t&agrave;u của đối thủ, với bộ trang bị giống &ldquo;Người Sắt&rdquo; - một nh&acirc;n vật truyện tranh v&agrave; điện ảnh Mỹ nổi tiếng to&agrave;n thế giới.</p>

<p>Bộ trang bị c&oacute; gắn 5 động cơ với 2 chiếc gắn ở mỗi c&aacute;nh tay, v&agrave; 1 động cơ gắn v&agrave;o lưng. Với bộ đồ n&agrave;y, người mặc c&oacute; thể bay với tốc độ 88,51 km/h.</p>

<p>Viện Hải qu&acirc;n Mỹ cũng tiết lộ Bộ Tư lệnh Đặc nhiệm Mỹ cũng đang c&acirc;n nhắc một bộ trang bị tương tự &ldquo;c&oacute; thể đạt được tốc độ 321 km/h&rdquo;.</p>

<p>Theo&nbsp;<em>Sputnik</em>, bộ trang bị trong đoạn video l&agrave; sản phẩm của c&ocirc;ng ty Anh Gravity Industries, được th&agrave;nh lập v&agrave;o năm 2017 v&agrave; c&oacute; trụ sở ở Salisbury, Anh.</p>

<p>Người s&aacute;ng lập c&ocirc;ng ty Richard Browning đ&atilde; từng bay qua khoảng c&aacute;ch 1,3 km từ L&acirc;u đ&agrave;i Hurst ở Lymington tr&ecirc;n đất liền Anh băng qua eo biển Solent v&agrave; hạ c&aacute;nh ở Ph&aacute;o đ&agrave;i Albert ở Freshwater, đảo Wight. Đ&acirc;y l&agrave; chuyến bay d&agrave;i nhất m&agrave; Browning từng thực hiện. Browning cũng hợp t&aacute;c với hải qu&acirc;n Anh trong nỗ lực ứng dụng c&ocirc;ng nghệ n&agrave;y cho mục đ&iacute;ch qu&acirc;n sự.&nbsp;</p>
', 1, N'1_132195017985165066_1.jpg', 5000000, 10)
INSERT [dbo].[Products] ([id], [category_id], [name], [description], [content], [hot], [photo], [price], [discount]) VALUES (23, 1, N'IPhone 2', N'<p>Một đoạn video mới được đăng tải tr&ecirc;n mạng x&atilde; hội cho thấy nh&oacute;m qu&acirc;n nh&acirc;n Anh mặc bộ trang bị đặc biệt cho ph&eacute;p họ c&oacute; thể bay lượn như &ldquo;si&ecirc;u nh&acirc;n&rdquo; để thực hiện b&agrave;i diễn tập đổ bộ t&agrave;u chiến.</p>
', N'<p>Viện Hải qu&acirc;n Mỹ cuối tuần qua đ&atilde; đăng tải một đoạn video ghi lại cảnh đội &ldquo;người bay&rdquo; của hải qu&acirc;n Anh thực hiện c&aacute;c kỹ thuật m&agrave;&nbsp;<em>Sputnik</em>&nbsp;m&ocirc; tả l&agrave; &ldquo;giống từ một bộ phim h&agrave;nh động&rdquo;.</p>

<p>Trong đoạn video, c&aacute;c binh sĩ đ&atilde; diễn tập chiếm t&agrave;u của đối thủ, với bộ trang bị giống &ldquo;Người Sắt&rdquo; - một nh&acirc;n vật truyện tranh v&agrave; điện ảnh Mỹ nổi tiếng to&agrave;n thế giới.</p>

<p>Bộ trang bị c&oacute; gắn 5 động cơ với 2 chiếc gắn ở mỗi c&aacute;nh tay, v&agrave; 1 động cơ gắn v&agrave;o lưng. Với bộ đồ n&agrave;y, người mặc c&oacute; thể bay với tốc độ 88,51 km/h.</p>

<p>Viện Hải qu&acirc;n Mỹ cũng tiết lộ Bộ Tư lệnh Đặc nhiệm Mỹ cũng đang c&acirc;n nhắc một bộ trang bị tương tự &ldquo;c&oacute; thể đạt được tốc độ 321 km/h&rdquo;.</p>

<p>Theo&nbsp;<em>Sputnik</em>, bộ trang bị trong đoạn video l&agrave; sản phẩm của c&ocirc;ng ty Anh Gravity Industries, được th&agrave;nh lập v&agrave;o năm 2017 v&agrave; c&oacute; trụ sở ở Salisbury, Anh.</p>

<p>Người s&aacute;ng lập c&ocirc;ng ty Richard Browning đ&atilde; từng bay qua khoảng c&aacute;ch 1,3 km từ L&acirc;u đ&agrave;i Hurst ở Lymington tr&ecirc;n đất liền Anh băng qua eo biển Solent v&agrave; hạ c&aacute;nh ở Ph&aacute;o đ&agrave;i Albert ở Freshwater, đảo Wight. Đ&acirc;y l&agrave; chuyến bay d&agrave;i nhất m&agrave; Browning từng thực hiện. Browning cũng hợp t&aacute;c với hải qu&acirc;n Anh trong nỗ lực ứng dụng c&ocirc;ng nghệ n&agrave;y cho mục đ&iacute;ch qu&acirc;n sự.&nbsp;</p>
', 1, N'132195018346013007_2.jpg', 6000000, 20)
INSERT [dbo].[Products] ([id], [category_id], [name], [description], [content], [hot], [photo], [price], [discount]) VALUES (24, 1, N'IPhone 3', N'<p>Một đoạn video mới được đăng tải tr&ecirc;n mạng x&atilde; hội cho thấy nh&oacute;m qu&acirc;n nh&acirc;n Anh mặc bộ trang bị đặc biệt cho ph&eacute;p họ c&oacute; thể bay lượn như &ldquo;si&ecirc;u nh&acirc;n&rdquo; để thực hiện b&agrave;i diễn tập đổ bộ t&agrave;u chiến.</p>
', N'<p>Viện Hải qu&acirc;n Mỹ cuối tuần qua đ&atilde; đăng tải một đoạn video ghi lại cảnh đội &ldquo;người bay&rdquo; của hải qu&acirc;n Anh thực hiện c&aacute;c kỹ thuật m&agrave;&nbsp;<em>Sputnik</em>&nbsp;m&ocirc; tả l&agrave; &ldquo;giống từ một bộ phim h&agrave;nh động&rdquo;.</p>

<p>Trong đoạn video, c&aacute;c binh sĩ đ&atilde; diễn tập chiếm t&agrave;u của đối thủ, với bộ trang bị giống &ldquo;Người Sắt&rdquo; - một nh&acirc;n vật truyện tranh v&agrave; điện ảnh Mỹ nổi tiếng to&agrave;n thế giới.</p>

<p>Bộ trang bị c&oacute; gắn 5 động cơ với 2 chiếc gắn ở mỗi c&aacute;nh tay, v&agrave; 1 động cơ gắn v&agrave;o lưng. Với bộ đồ n&agrave;y, người mặc c&oacute; thể bay với tốc độ 88,51 km/h.</p>

<p>Viện Hải qu&acirc;n Mỹ cũng tiết lộ Bộ Tư lệnh Đặc nhiệm Mỹ cũng đang c&acirc;n nhắc một bộ trang bị tương tự &ldquo;c&oacute; thể đạt được tốc độ 321 km/h&rdquo;.</p>

<p>Theo&nbsp;<em>Sputnik</em>, bộ trang bị trong đoạn video l&agrave; sản phẩm của c&ocirc;ng ty Anh Gravity Industries, được th&agrave;nh lập v&agrave;o năm 2017 v&agrave; c&oacute; trụ sở ở Salisbury, Anh.</p>

<p>Người s&aacute;ng lập c&ocirc;ng ty Richard Browning đ&atilde; từng bay qua khoảng c&aacute;ch 1,3 km từ L&acirc;u đ&agrave;i Hurst ở Lymington tr&ecirc;n đất liền Anh băng qua eo biển Solent v&agrave; hạ c&aacute;nh ở Ph&aacute;o đ&agrave;i Albert ở Freshwater, đảo Wight. Đ&acirc;y l&agrave; chuyến bay d&agrave;i nhất m&agrave; Browning từng thực hiện. Browning cũng hợp t&aacute;c với hải qu&acirc;n Anh trong nỗ lực ứng dụng c&ocirc;ng nghệ n&agrave;y cho mục đ&iacute;ch qu&acirc;n sự.&nbsp;</p>
', 1, N'132195018673480610_3.jpg', 7000000, 30)
INSERT [dbo].[Products] ([id], [category_id], [name], [description], [content], [hot], [photo], [price], [discount]) VALUES (25, 1, N'IPhone 4', N'<p>Một đoạn video mới được đăng tải tr&ecirc;n mạng x&atilde; hội cho thấy nh&oacute;m qu&acirc;n nh&acirc;n Anh mặc bộ trang bị đặc biệt cho ph&eacute;p họ c&oacute; thể bay lượn như &ldquo;si&ecirc;u nh&acirc;n&rdquo; để thực hiện b&agrave;i diễn tập đổ bộ t&agrave;u chiến.</p>
', N'<p>Viện Hải qu&acirc;n Mỹ cuối tuần qua đ&atilde; đăng tải một đoạn video ghi lại cảnh đội &ldquo;người bay&rdquo; của hải qu&acirc;n Anh thực hiện c&aacute;c kỹ thuật m&agrave;&nbsp;<em>Sputnik</em>&nbsp;m&ocirc; tả l&agrave; &ldquo;giống từ một bộ phim h&agrave;nh động&rdquo;.</p>

<p>Trong đoạn video, c&aacute;c binh sĩ đ&atilde; diễn tập chiếm t&agrave;u của đối thủ, với bộ trang bị giống &ldquo;Người Sắt&rdquo; - một nh&acirc;n vật truyện tranh v&agrave; điện ảnh Mỹ nổi tiếng to&agrave;n thế giới.</p>

<p>Bộ trang bị c&oacute; gắn 5 động cơ với 2 chiếc gắn ở mỗi c&aacute;nh tay, v&agrave; 1 động cơ gắn v&agrave;o lưng. Với bộ đồ n&agrave;y, người mặc c&oacute; thể bay với tốc độ 88,51 km/h.</p>

<p>Viện Hải qu&acirc;n Mỹ cũng tiết lộ Bộ Tư lệnh Đặc nhiệm Mỹ cũng đang c&acirc;n nhắc một bộ trang bị tương tự &ldquo;c&oacute; thể đạt được tốc độ 321 km/h&rdquo;.</p>

<p>Theo&nbsp;<em>Sputnik</em>, bộ trang bị trong đoạn video l&agrave; sản phẩm của c&ocirc;ng ty Anh Gravity Industries, được th&agrave;nh lập v&agrave;o năm 2017 v&agrave; c&oacute; trụ sở ở Salisbury, Anh.</p>

<p>Người s&aacute;ng lập c&ocirc;ng ty Richard Browning đ&atilde; từng bay qua khoảng c&aacute;ch 1,3 km từ L&acirc;u đ&agrave;i Hurst ở Lymington tr&ecirc;n đất liền Anh băng qua eo biển Solent v&agrave; hạ c&aacute;nh ở Ph&aacute;o đ&agrave;i Albert ở Freshwater, đảo Wight. Đ&acirc;y l&agrave; chuyến bay d&agrave;i nhất m&agrave; Browning từng thực hiện. Browning cũng hợp t&aacute;c với hải qu&acirc;n Anh trong nỗ lực ứng dụng c&ocirc;ng nghệ n&agrave;y cho mục đ&iacute;ch qu&acirc;n sự.&nbsp;</p>
', 0, N'132195019156699102_4.jpg', 8000000, 40)
INSERT [dbo].[Products] ([id], [category_id], [name], [description], [content], [hot], [photo], [price], [discount]) VALUES (26, 1, N'IPhone 5', N'<p>Một đoạn video mới được đăng tải tr&ecirc;n mạng x&atilde; hội cho thấy nh&oacute;m qu&acirc;n nh&acirc;n Anh mặc bộ trang bị đặc biệt cho ph&eacute;p họ c&oacute; thể bay lượn như &ldquo;si&ecirc;u nh&acirc;n&rdquo; để thực hiện b&agrave;i diễn tập đổ bộ t&agrave;u chiến.</p>
', N'<p>Viện Hải qu&acirc;n Mỹ cuối tuần qua đ&atilde; đăng tải một đoạn video ghi lại cảnh đội &ldquo;người bay&rdquo; của hải qu&acirc;n Anh thực hiện c&aacute;c kỹ thuật m&agrave;&nbsp;<em>Sputnik</em>&nbsp;m&ocirc; tả l&agrave; &ldquo;giống từ một bộ phim h&agrave;nh động&rdquo;.</p>

<p>Trong đoạn video, c&aacute;c binh sĩ đ&atilde; diễn tập chiếm t&agrave;u của đối thủ, với bộ trang bị giống &ldquo;Người Sắt&rdquo; - một nh&acirc;n vật truyện tranh v&agrave; điện ảnh Mỹ nổi tiếng to&agrave;n thế giới.</p>

<p>Bộ trang bị c&oacute; gắn 5 động cơ với 2 chiếc gắn ở mỗi c&aacute;nh tay, v&agrave; 1 động cơ gắn v&agrave;o lưng. Với bộ đồ n&agrave;y, người mặc c&oacute; thể bay với tốc độ 88,51 km/h.</p>

<p>Viện Hải qu&acirc;n Mỹ cũng tiết lộ Bộ Tư lệnh Đặc nhiệm Mỹ cũng đang c&acirc;n nhắc một bộ trang bị tương tự &ldquo;c&oacute; thể đạt được tốc độ 321 km/h&rdquo;.</p>

<p>Theo&nbsp;<em>Sputnik</em>, bộ trang bị trong đoạn video l&agrave; sản phẩm của c&ocirc;ng ty Anh Gravity Industries, được th&agrave;nh lập v&agrave;o năm 2017 v&agrave; c&oacute; trụ sở ở Salisbury, Anh.</p>

<p>Người s&aacute;ng lập c&ocirc;ng ty Richard Browning đ&atilde; từng bay qua khoảng c&aacute;ch 1,3 km từ L&acirc;u đ&agrave;i Hurst ở Lymington tr&ecirc;n đất liền Anh băng qua eo biển Solent v&agrave; hạ c&aacute;nh ở Ph&aacute;o đ&agrave;i Albert ở Freshwater, đảo Wight. Đ&acirc;y l&agrave; chuyến bay d&agrave;i nhất m&agrave; Browning từng thực hiện. Browning cũng hợp t&aacute;c với hải qu&acirc;n Anh trong nỗ lực ứng dụng c&ocirc;ng nghệ n&agrave;y cho mục đ&iacute;ch qu&acirc;n sự.&nbsp;</p>
', 0, N'132195019983557925_6.jpg', 9000000, 0)
INSERT [dbo].[Products] ([id], [category_id], [name], [description], [content], [hot], [photo], [price], [discount]) VALUES (27, 1, N'IPhone 6', N'<p>Một đoạn video mới được đăng tải tr&ecirc;n mạng x&atilde; hội cho thấy nh&oacute;m qu&acirc;n nh&acirc;n Anh mặc bộ trang bị đặc biệt cho ph&eacute;p họ c&oacute; thể bay lượn như &ldquo;si&ecirc;u nh&acirc;n&rdquo; để thực hiện b&agrave;i diễn tập đổ bộ t&agrave;u chiến.</p>
', N'<p>Viện Hải qu&acirc;n Mỹ cuối tuần qua đ&atilde; đăng tải một đoạn video ghi lại cảnh đội &ldquo;người bay&rdquo; của hải qu&acirc;n Anh thực hiện c&aacute;c kỹ thuật m&agrave;&nbsp;<em>Sputnik</em>&nbsp;m&ocirc; tả l&agrave; &ldquo;giống từ một bộ phim h&agrave;nh động&rdquo;.</p>

<p>Trong đoạn video, c&aacute;c binh sĩ đ&atilde; diễn tập chiếm t&agrave;u của đối thủ, với bộ trang bị giống &ldquo;Người Sắt&rdquo; - một nh&acirc;n vật truyện tranh v&agrave; điện ảnh Mỹ nổi tiếng to&agrave;n thế giới.</p>

<p>Bộ trang bị c&oacute; gắn 5 động cơ với 2 chiếc gắn ở mỗi c&aacute;nh tay, v&agrave; 1 động cơ gắn v&agrave;o lưng. Với bộ đồ n&agrave;y, người mặc c&oacute; thể bay với tốc độ 88,51 km/h.</p>

<p>Viện Hải qu&acirc;n Mỹ cũng tiết lộ Bộ Tư lệnh Đặc nhiệm Mỹ cũng đang c&acirc;n nhắc một bộ trang bị tương tự &ldquo;c&oacute; thể đạt được tốc độ 321 km/h&rdquo;.</p>

<p>Theo&nbsp;<em>Sputnik</em>, bộ trang bị trong đoạn video l&agrave; sản phẩm của c&ocirc;ng ty Anh Gravity Industries, được th&agrave;nh lập v&agrave;o năm 2017 v&agrave; c&oacute; trụ sở ở Salisbury, Anh.</p>

<p>Người s&aacute;ng lập c&ocirc;ng ty Richard Browning đ&atilde; từng bay qua khoảng c&aacute;ch 1,3 km từ L&acirc;u đ&agrave;i Hurst ở Lymington tr&ecirc;n đất liền Anh băng qua eo biển Solent v&agrave; hạ c&aacute;nh ở Ph&aacute;o đ&agrave;i Albert ở Freshwater, đảo Wight. Đ&acirc;y l&agrave; chuyến bay d&agrave;i nhất m&agrave; Browning từng thực hiện. Browning cũng hợp t&aacute;c với hải qu&acirc;n Anh trong nỗ lực ứng dụng c&ocirc;ng nghệ n&agrave;y cho mục đ&iacute;ch qu&acirc;n sự.&nbsp;</p>
', 1, N'132195020344748063_7.jpg', 10000000, 20)
INSERT [dbo].[Products] ([id], [category_id], [name], [description], [content], [hot], [photo], [price], [discount]) VALUES (28, 3, N'Samsung 1', N'<p>Một đoạn video mới được đăng tải tr&ecirc;n mạng x&atilde; hội cho thấy nh&oacute;m qu&acirc;n nh&acirc;n Anh mặc bộ trang bị đặc biệt cho ph&eacute;p họ c&oacute; thể bay lượn như &ldquo;si&ecirc;u nh&acirc;n&rdquo; để thực hiện b&agrave;i diễn tập đổ bộ t&agrave;u chiến.</p>
', N'<p>Viện Hải qu&acirc;n Mỹ cuối tuần qua đ&atilde; đăng tải một đoạn video ghi lại cảnh đội &ldquo;người bay&rdquo; của hải qu&acirc;n Anh thực hiện c&aacute;c kỹ thuật m&agrave;&nbsp;<em>Sputnik</em>&nbsp;m&ocirc; tả l&agrave; &ldquo;giống từ một bộ phim h&agrave;nh động&rdquo;.</p>

<p>Trong đoạn video, c&aacute;c binh sĩ đ&atilde; diễn tập chiếm t&agrave;u của đối thủ, với bộ trang bị giống &ldquo;Người Sắt&rdquo; - một nh&acirc;n vật truyện tranh v&agrave; điện ảnh Mỹ nổi tiếng to&agrave;n thế giới.</p>

<p>Bộ trang bị c&oacute; gắn 5 động cơ với 2 chiếc gắn ở mỗi c&aacute;nh tay, v&agrave; 1 động cơ gắn v&agrave;o lưng. Với bộ đồ n&agrave;y, người mặc c&oacute; thể bay với tốc độ 88,51 km/h.</p>

<p>Viện Hải qu&acirc;n Mỹ cũng tiết lộ Bộ Tư lệnh Đặc nhiệm Mỹ cũng đang c&acirc;n nhắc một bộ trang bị tương tự &ldquo;c&oacute; thể đạt được tốc độ 321 km/h&rdquo;.</p>

<p>Theo&nbsp;<em>Sputnik</em>, bộ trang bị trong đoạn video l&agrave; sản phẩm của c&ocirc;ng ty Anh Gravity Industries, được th&agrave;nh lập v&agrave;o năm 2017 v&agrave; c&oacute; trụ sở ở Salisbury, Anh.</p>

<p>Người s&aacute;ng lập c&ocirc;ng ty Richard Browning đ&atilde; từng bay qua khoảng c&aacute;ch 1,3 km từ L&acirc;u đ&agrave;i Hurst ở Lymington tr&ecirc;n đất liền Anh băng qua eo biển Solent v&agrave; hạ c&aacute;nh ở Ph&aacute;o đ&agrave;i Albert ở Freshwater, đảo Wight. Đ&acirc;y l&agrave; chuyến bay d&agrave;i nhất m&agrave; Browning từng thực hiện. Browning cũng hợp t&aacute;c với hải qu&acirc;n Anh trong nỗ lực ứng dụng c&ocirc;ng nghệ n&agrave;y cho mục đ&iacute;ch qu&acirc;n sự.&nbsp;</p>
', 1, N'132195020732826532_8.jpg', 7000000, 15)
INSERT [dbo].[Products] ([id], [category_id], [name], [description], [content], [hot], [photo], [price], [discount]) VALUES (29, 3, N'Samsung 2', N'<p>Một đoạn video mới được đăng tải tr&ecirc;n mạng x&atilde; hội cho thấy nh&oacute;m qu&acirc;n nh&acirc;n Anh mặc bộ trang bị đặc biệt cho ph&eacute;p họ c&oacute; thể bay lượn như &ldquo;si&ecirc;u nh&acirc;n&rdquo; để thực hiện b&agrave;i diễn tập đổ bộ t&agrave;u chiến.</p>
', N'<p>Viện Hải qu&acirc;n Mỹ cuối tuần qua đ&atilde; đăng tải một đoạn video ghi lại cảnh đội &ldquo;người bay&rdquo; của hải qu&acirc;n Anh thực hiện c&aacute;c kỹ thuật m&agrave;&nbsp;<em>Sputnik</em>&nbsp;m&ocirc; tả l&agrave; &ldquo;giống từ một bộ phim h&agrave;nh động&rdquo;.</p>

<p>Trong đoạn video, c&aacute;c binh sĩ đ&atilde; diễn tập chiếm t&agrave;u của đối thủ, với bộ trang bị giống &ldquo;Người Sắt&rdquo; - một nh&acirc;n vật truyện tranh v&agrave; điện ảnh Mỹ nổi tiếng to&agrave;n thế giới.</p>

<p>Bộ trang bị c&oacute; gắn 5 động cơ với 2 chiếc gắn ở mỗi c&aacute;nh tay, v&agrave; 1 động cơ gắn v&agrave;o lưng. Với bộ đồ n&agrave;y, người mặc c&oacute; thể bay với tốc độ 88,51 km/h.</p>

<p>Viện Hải qu&acirc;n Mỹ cũng tiết lộ Bộ Tư lệnh Đặc nhiệm Mỹ cũng đang c&acirc;n nhắc một bộ trang bị tương tự &ldquo;c&oacute; thể đạt được tốc độ 321 km/h&rdquo;.</p>

<p>Theo&nbsp;<em>Sputnik</em>, bộ trang bị trong đoạn video l&agrave; sản phẩm của c&ocirc;ng ty Anh Gravity Industries, được th&agrave;nh lập v&agrave;o năm 2017 v&agrave; c&oacute; trụ sở ở Salisbury, Anh.</p>

<p>Người s&aacute;ng lập c&ocirc;ng ty Richard Browning đ&atilde; từng bay qua khoảng c&aacute;ch 1,3 km từ L&acirc;u đ&agrave;i Hurst ở Lymington tr&ecirc;n đất liền Anh băng qua eo biển Solent v&agrave; hạ c&aacute;nh ở Ph&aacute;o đ&agrave;i Albert ở Freshwater, đảo Wight. Đ&acirc;y l&agrave; chuyến bay d&agrave;i nhất m&agrave; Browning từng thực hiện. Browning cũng hợp t&aacute;c với hải qu&acirc;n Anh trong nỗ lực ứng dụng c&ocirc;ng nghệ n&agrave;y cho mục đ&iacute;ch qu&acirc;n sự.&nbsp;</p>
', 1, N'132195021199455963_9.jpg', 9000000, 25)
INSERT [dbo].[Products] ([id], [category_id], [name], [description], [content], [hot], [photo], [price], [discount]) VALUES (30, 3, N'Samsung 3', N'<p>Một đoạn video mới được đăng tải tr&ecirc;n mạng x&atilde; hội cho thấy nh&oacute;m qu&acirc;n nh&acirc;n Anh mặc bộ trang bị đặc biệt cho ph&eacute;p họ c&oacute; thể bay lượn như &ldquo;si&ecirc;u nh&acirc;n&rdquo; để thực hiện b&agrave;i diễn tập đổ bộ t&agrave;u chiến.</p>
', N'<p>Viện Hải qu&acirc;n Mỹ cuối tuần qua đ&atilde; đăng tải một đoạn video ghi lại cảnh đội &ldquo;người bay&rdquo; của hải qu&acirc;n Anh thực hiện c&aacute;c kỹ thuật m&agrave;&nbsp;<em>Sputnik</em>&nbsp;m&ocirc; tả l&agrave; &ldquo;giống từ một bộ phim h&agrave;nh động&rdquo;.</p>

<p>Trong đoạn video, c&aacute;c binh sĩ đ&atilde; diễn tập chiếm t&agrave;u của đối thủ, với bộ trang bị giống &ldquo;Người Sắt&rdquo; - một nh&acirc;n vật truyện tranh v&agrave; điện ảnh Mỹ nổi tiếng to&agrave;n thế giới.</p>

<p>Bộ trang bị c&oacute; gắn 5 động cơ với 2 chiếc gắn ở mỗi c&aacute;nh tay, v&agrave; 1 động cơ gắn v&agrave;o lưng. Với bộ đồ n&agrave;y, người mặc c&oacute; thể bay với tốc độ 88,51 km/h.</p>

<p>Viện Hải qu&acirc;n Mỹ cũng tiết lộ Bộ Tư lệnh Đặc nhiệm Mỹ cũng đang c&acirc;n nhắc một bộ trang bị tương tự &ldquo;c&oacute; thể đạt được tốc độ 321 km/h&rdquo;.</p>

<p>Theo&nbsp;<em>Sputnik</em>, bộ trang bị trong đoạn video l&agrave; sản phẩm của c&ocirc;ng ty Anh Gravity Industries, được th&agrave;nh lập v&agrave;o năm 2017 v&agrave; c&oacute; trụ sở ở Salisbury, Anh.</p>

<p>Người s&aacute;ng lập c&ocirc;ng ty Richard Browning đ&atilde; từng bay qua khoảng c&aacute;ch 1,3 km từ L&acirc;u đ&agrave;i Hurst ở Lymington tr&ecirc;n đất liền Anh băng qua eo biển Solent v&agrave; hạ c&aacute;nh ở Ph&aacute;o đ&agrave;i Albert ở Freshwater, đảo Wight. Đ&acirc;y l&agrave; chuyến bay d&agrave;i nhất m&agrave; Browning từng thực hiện. Browning cũng hợp t&aacute;c với hải qu&acirc;n Anh trong nỗ lực ứng dụng c&ocirc;ng nghệ n&agrave;y cho mục đ&iacute;ch qu&acirc;n sự.&nbsp;</p>
', 1, N'132218023958008825_1.jpg', 7000000, 10)
INSERT [dbo].[Products] ([id], [category_id], [name], [description], [content], [hot], [photo], [price], [discount]) VALUES (31, 3, N'Samsung 4', N'<p>Một đoạn video mới được đăng tải tr&ecirc;n mạng x&atilde; hội cho thấy nh&oacute;m qu&acirc;n nh&acirc;n Anh mặc bộ trang bị đặc biệt cho ph&eacute;p họ c&oacute; thể bay lượn như &ldquo;si&ecirc;u nh&acirc;n&rdquo; để thực hiện b&agrave;i diễn tập đổ bộ t&agrave;u chiến.</p>
', N'<p>Viện Hải qu&acirc;n Mỹ cuối tuần qua đ&atilde; đăng tải một đoạn video ghi lại cảnh đội &ldquo;người bay&rdquo; của hải qu&acirc;n Anh thực hiện c&aacute;c kỹ thuật m&agrave;&nbsp;<em>Sputnik</em>&nbsp;m&ocirc; tả l&agrave; &ldquo;giống từ một bộ phim h&agrave;nh động&rdquo;.</p>

<p>Trong đoạn video, c&aacute;c binh sĩ đ&atilde; diễn tập chiếm t&agrave;u của đối thủ, với bộ trang bị giống &ldquo;Người Sắt&rdquo; - một nh&acirc;n vật truyện tranh v&agrave; điện ảnh Mỹ nổi tiếng to&agrave;n thế giới.</p>

<p>Bộ trang bị c&oacute; gắn 5 động cơ với 2 chiếc gắn ở mỗi c&aacute;nh tay, v&agrave; 1 động cơ gắn v&agrave;o lưng. Với bộ đồ n&agrave;y, người mặc c&oacute; thể bay với tốc độ 88,51 km/h.</p>

<p>Viện Hải qu&acirc;n Mỹ cũng tiết lộ Bộ Tư lệnh Đặc nhiệm Mỹ cũng đang c&acirc;n nhắc một bộ trang bị tương tự &ldquo;c&oacute; thể đạt được tốc độ 321 km/h&rdquo;.</p>

<p>Theo&nbsp;<em>Sputnik</em>, bộ trang bị trong đoạn video l&agrave; sản phẩm của c&ocirc;ng ty Anh Gravity Industries, được th&agrave;nh lập v&agrave;o năm 2017 v&agrave; c&oacute; trụ sở ở Salisbury, Anh.</p>

<p>Người s&aacute;ng lập c&ocirc;ng ty Richard Browning đ&atilde; từng bay qua khoảng c&aacute;ch 1,3 km từ L&acirc;u đ&agrave;i Hurst ở Lymington tr&ecirc;n đất liền Anh băng qua eo biển Solent v&agrave; hạ c&aacute;nh ở Ph&aacute;o đ&agrave;i Albert ở Freshwater, đảo Wight. Đ&acirc;y l&agrave; chuyến bay d&agrave;i nhất m&agrave; Browning từng thực hiện. Browning cũng hợp t&aacute;c với hải qu&acirc;n Anh trong nỗ lực ứng dụng c&ocirc;ng nghệ n&agrave;y cho mục đ&iacute;ch qu&acirc;n sự.&nbsp;</p>
', 0, N'132218024222456931_2.jpg', 12000000, 30)
INSERT [dbo].[Products] ([id], [category_id], [name], [description], [content], [hot], [photo], [price], [discount]) VALUES (32, 3, N'Samsung 5', N'<p>Một đoạn video mới được đăng tải tr&ecirc;n mạng x&atilde; hội cho thấy nh&oacute;m qu&acirc;n nh&acirc;n Anh mặc bộ trang bị đặc biệt cho ph&eacute;p họ c&oacute; thể bay lượn như &ldquo;si&ecirc;u nh&acirc;n&rdquo; để thực hiện b&agrave;i diễn tập đổ bộ t&agrave;u chiến.</p>
', N'<p>Viện Hải qu&acirc;n Mỹ cuối tuần qua đ&atilde; đăng tải một đoạn video ghi lại cảnh đội &ldquo;người bay&rdquo; của hải qu&acirc;n Anh thực hiện c&aacute;c kỹ thuật m&agrave;&nbsp;<em>Sputnik</em>&nbsp;m&ocirc; tả l&agrave; &ldquo;giống từ một bộ phim h&agrave;nh động&rdquo;.</p>

<p>Trong đoạn video, c&aacute;c binh sĩ đ&atilde; diễn tập chiếm t&agrave;u của đối thủ, với bộ trang bị giống &ldquo;Người Sắt&rdquo; - một nh&acirc;n vật truyện tranh v&agrave; điện ảnh Mỹ nổi tiếng to&agrave;n thế giới.</p>

<p>Bộ trang bị c&oacute; gắn 5 động cơ với 2 chiếc gắn ở mỗi c&aacute;nh tay, v&agrave; 1 động cơ gắn v&agrave;o lưng. Với bộ đồ n&agrave;y, người mặc c&oacute; thể bay với tốc độ 88,51 km/h.</p>

<p>Viện Hải qu&acirc;n Mỹ cũng tiết lộ Bộ Tư lệnh Đặc nhiệm Mỹ cũng đang c&acirc;n nhắc một bộ trang bị tương tự &ldquo;c&oacute; thể đạt được tốc độ 321 km/h&rdquo;.</p>

<p>Theo&nbsp;<em>Sputnik</em>, bộ trang bị trong đoạn video l&agrave; sản phẩm của c&ocirc;ng ty Anh Gravity Industries, được th&agrave;nh lập v&agrave;o năm 2017 v&agrave; c&oacute; trụ sở ở Salisbury, Anh.</p>

<p>Người s&aacute;ng lập c&ocirc;ng ty Richard Browning đ&atilde; từng bay qua khoảng c&aacute;ch 1,3 km từ L&acirc;u đ&agrave;i Hurst ở Lymington tr&ecirc;n đất liền Anh băng qua eo biển Solent v&agrave; hạ c&aacute;nh ở Ph&aacute;o đ&agrave;i Albert ở Freshwater, đảo Wight. Đ&acirc;y l&agrave; chuyến bay d&agrave;i nhất m&agrave; Browning từng thực hiện. Browning cũng hợp t&aacute;c với hải qu&acirc;n Anh trong nỗ lực ứng dụng c&ocirc;ng nghệ n&agrave;y cho mục đ&iacute;ch qu&acirc;n sự.&nbsp;</p>
', 0, N'132218025263764024_5.jpg', 8.5, 13)
INSERT [dbo].[Products] ([id], [category_id], [name], [description], [content], [hot], [photo], [price], [discount]) VALUES (33, 3, N'Samsung 6', N'<p>Một đoạn video mới được đăng tải tr&ecirc;n mạng x&atilde; hội cho thấy nh&oacute;m qu&acirc;n nh&acirc;n Anh mặc bộ trang bị đặc biệt cho ph&eacute;p họ c&oacute; thể bay lượn như &ldquo;si&ecirc;u nh&acirc;n&rdquo; để thực hiện b&agrave;i diễn tập đổ bộ t&agrave;u chiến.</p>
', N'<p>Viện Hải qu&acirc;n Mỹ cuối tuần qua đ&atilde; đăng tải một đoạn video ghi lại cảnh đội &ldquo;người bay&rdquo; của hải qu&acirc;n Anh thực hiện c&aacute;c kỹ thuật m&agrave;&nbsp;<em>Sputnik</em>&nbsp;m&ocirc; tả l&agrave; &ldquo;giống từ một bộ phim h&agrave;nh động&rdquo;.</p>

<p>Trong đoạn video, c&aacute;c binh sĩ đ&atilde; diễn tập chiếm t&agrave;u của đối thủ, với bộ trang bị giống &ldquo;Người Sắt&rdquo; - một nh&acirc;n vật truyện tranh v&agrave; điện ảnh Mỹ nổi tiếng to&agrave;n thế giới.</p>

<p>Bộ trang bị c&oacute; gắn 5 động cơ với 2 chiếc gắn ở mỗi c&aacute;nh tay, v&agrave; 1 động cơ gắn v&agrave;o lưng. Với bộ đồ n&agrave;y, người mặc c&oacute; thể bay với tốc độ 88,51 km/h.</p>

<p>Viện Hải qu&acirc;n Mỹ cũng tiết lộ Bộ Tư lệnh Đặc nhiệm Mỹ cũng đang c&acirc;n nhắc một bộ trang bị tương tự &ldquo;c&oacute; thể đạt được tốc độ 321 km/h&rdquo;.</p>

<p>Theo&nbsp;<em>Sputnik</em>, bộ trang bị trong đoạn video l&agrave; sản phẩm của c&ocirc;ng ty Anh Gravity Industries, được th&agrave;nh lập v&agrave;o năm 2017 v&agrave; c&oacute; trụ sở ở Salisbury, Anh.</p>

<p>Người s&aacute;ng lập c&ocirc;ng ty Richard Browning đ&atilde; từng bay qua khoảng c&aacute;ch 1,3 km từ L&acirc;u đ&agrave;i Hurst ở Lymington tr&ecirc;n đất liền Anh băng qua eo biển Solent v&agrave; hạ c&aacute;nh ở Ph&aacute;o đ&agrave;i Albert ở Freshwater, đảo Wight. Đ&acirc;y l&agrave; chuyến bay d&agrave;i nhất m&agrave; Browning từng thực hiện. Browning cũng hợp t&aacute;c với hải qu&acirc;n Anh trong nỗ lực ứng dụng c&ocirc;ng nghệ n&agrave;y cho mục đ&iacute;ch qu&acirc;n sự.&nbsp;</p>
', 0, N'132218026418235444_8.jpg', 13000000, 25)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductsImages] ON 

INSERT [dbo].[ProductsImages] ([id], [product_id], [photo]) VALUES (5, 33, N'132195017985165066_1.jpg')
INSERT [dbo].[ProductsImages] ([id], [product_id], [photo]) VALUES (6, 33, N'132195018346013007_2.jpg')
INSERT [dbo].[ProductsImages] ([id], [product_id], [photo]) VALUES (7, 33, N'132195018673480610_3.jpg')
INSERT [dbo].[ProductsImages] ([id], [product_id], [photo]) VALUES (8, 33, N'132195019156699102_4.jpg')
INSERT [dbo].[ProductsImages] ([id], [product_id], [photo]) VALUES (9, 33, N'132195019983557925_6.jpg')
SET IDENTITY_INSERT [dbo].[ProductsImages] OFF
SET IDENTITY_INSERT [dbo].[Ratings] ON 

INSERT [dbo].[Ratings] ([id], [product_id], [star]) VALUES (1, 30, 4)
INSERT [dbo].[Ratings] ([id], [product_id], [star]) VALUES (2, 30, 3)
INSERT [dbo].[Ratings] ([id], [product_id], [star]) VALUES (3, 30, 4)
INSERT [dbo].[Ratings] ([id], [product_id], [star]) VALUES (4, 30, 5)
INSERT [dbo].[Ratings] ([id], [product_id], [star]) VALUES (5, 30, 5)
SET IDENTITY_INSERT [dbo].[Ratings] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [name], [email], [password]) VALUES (1, N'Nguyễn Van A', N'nva@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3')
INSERT [dbo].[Users] ([id], [name], [email], [password]) VALUES (2, N'Nguyễn Van B', N'nvb@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3')
INSERT [dbo].[Users] ([id], [name], [email], [password]) VALUES (3, N'Nguyễn Van C', N'nvc@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3')
INSERT [dbo].[Users] ([id], [name], [email], [password]) VALUES (4, N'Nguyễn Van D', N'nvd@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3')
INSERT [dbo].[Users] ([id], [name], [email], [password]) VALUES (5, N'Nguyễn Van E', N'nve@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_parent_id]  DEFAULT ((0)) FOR [parent_id]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_hot]  DEFAULT ((0)) FOR [hot]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_status]  DEFAULT ((0)) FOR [status]
GO
