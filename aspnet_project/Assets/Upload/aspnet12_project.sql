USE [aspnet12_project]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/20/2020 7:00:22 PM ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 10/20/2020 7:00:22 PM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 10/20/2020 7:00:22 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 10/20/2020 7:00:22 PM ******/
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
INSERT [dbo].[Categories] ([id], [parent_id], [name]) VALUES (3, 0, N'Samsung')
INSERT [dbo].[Categories] ([id], [parent_id], [name]) VALUES (4, 1, N'IPhone XS')
INSERT [dbo].[Categories] ([id], [parent_id], [name]) VALUES (5, 1, N'IPhone XS Max')
INSERT [dbo].[Categories] ([id], [parent_id], [name]) VALUES (6, 2, N'LG A93')
INSERT [dbo].[Categories] ([id], [parent_id], [name]) VALUES (7, 2, N'LG A95')
SET IDENTITY_INSERT [dbo].[Categories] OFF
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
