USE [master]
GO
/****** Object:  Database [ASM_LongNH_FA223W]    Script Date: 12/7/2022 7:50:06 PM ******/
CREATE DATABASE [ASM_LongNH_FA223W]
GO
USE [ASM_LongNH_FA223W]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/7/2022 7:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[displayName] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[status] [bit] NOT NULL,
	[role] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/24/2022 7:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2/24/2022 7:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[productName] [nvarchar](255) NULL,
	[productImage] [nvarchar](255) NULL,
	[productPrice] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/24/2022 7:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[totalPrice] [float] NULL,
	[note] [text] NULL,
	[created_date] [date] NULL,
	[shipping_id] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/24/2022 7:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[description] [nvarchar](255) NULL,
	[image_url] [nvarchar](255) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[category_id] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 2/24/2022 7:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Piano')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Guitar')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Drawing')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (1, N'Guitar for kids', 9, 6.3, N'Family disruption due to other extended absence of family member', N'./images/1.jpg', CAST(N'2022-01-01' AS Date), CAST(N'2022-02-01' AS Date), 2, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (2, N'Accelerated Guitar', 8, 12.5, N'Other specified disorders of urethra', N'./images/2.jpg', CAST(N'2022-02-03' AS Date), CAST(N'2022-03-01' AS Date), 2, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (3, N'Guitar Online', 18, 10.3, N'Accidental poisoning by other paints and varnishes', N'./images/3.jpg', CAST(N'2021-02-10' AS Date), CAST(N'2022-04-01' AS Date), 2, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (4, N'Electric Guitar', 17, 13.2, N'Accidental poisoning by other paints and varnishes', N'./images/4.jpg', CAST(N'2021-02-20' AS Date), CAST(N'2022-04-20' AS Date), 2, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (5, N'Piano for kids', 6, 17, N'Wegener''s granulomatosis', N'./images/5.jpg', CAST(N'2022-02-23' AS Date), CAST(N'2022-04-05' AS Date), 1, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (6, N'Accompaniment Piano', 16, 5.2, N'Tuberculous encephalitis or myelitis, tubercle bacilli not found by bacteriological examination, but tuberculosis confirmed histologically', N'./images/6.jpg', CAST(N'2021-03-01' AS Date), CAST(N'2022-04-09' AS Date), 1, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (7, N'Piano basic', 19, 16.4, N'Arthropathy associated with mycoses, lower leg', N'./images/7.jpg', CAST(N'2021-03-07' AS Date), CAST(N'2022-04-25' AS Date), 1, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (8, N'Guitar basic', 10, 12.9, N'Generally contracted pelvis, delivered, with or without mention of antepartum condition', N'./images/8.jpg', CAST(N'2022-03-30' AS Date), CAST(N'2022-05-01' AS Date), 2, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (9, N'Piano Online', 15, 14.2, N'Mixed acid-base balance disorder', N'./images/9.jpg', CAST(N'2022-05-03' AS Date), CAST(N'2022-05-30' AS Date), 1, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (10, N'Organ keyboard', 13, 7.2, N'Personal history of other disorders of nervous system and sense organs', N'./images/10.jpg', CAST(N'2021-05-25' AS Date), CAST(N'2022-06-10' AS Date), 1, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (11, N'Accelerated Piano', 17, 10.4, N'Mixed malaria', N'./images/11.jpg', CAST(N'2021-06-05' AS Date), CAST(N'2022-06-15' AS Date), 1, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (12, N'Ukulele basic', 13, 15.9, N'Other and unspecified alcohol dependence, episodic', N'./images/12.jpg', CAST(N'2021-06-16' AS Date), CAST(N'2022-07-01' AS Date), 2, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (13, N'Beginer to master drawing', 15, 16.6, N'Orthopnea', N'./images/13.jpg', CAST(N'2021-07-02' AS Date), CAST(N'2022-07-25' AS Date), 3, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (14, N'The drawing and science', 13, 14.9, N'Poisoning by dental drugs topically applied', N'./images/14.jpg', CAST(N'2021-07-15' AS Date), CAST(N'2022-08-01' AS Date), 3, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (15, N'Piano chords', 11, 13.3, N'Reticulosarcoma, lymph nodes of axilla and upper limb', N'./images/15.jpg', CAST(N'2021-08-02' AS Date), CAST(N'2022-08-29' AS Date), 1, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (16, N'Guitar chords', 12, 9.6, N'Schizophreniform disorder, in remission', N'./images/16.jpg', CAST(N'2021-08-16' AS Date), CAST(N'2022-09-01' AS Date), 2, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (17, N'Piano improvisation mastery', 16, 10.2, N'Open fractures involving skull or face with other bones, with other and unspecified intracranial hemorrhage, unspecified state of consciousness', N'./images/17.jpg', CAST(N'2021-08-29' AS Date), CAST(N'2022-09-20' AS Date), 1, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (18, N'Beginer piano', 17, 19.9, N'Accident caused by ignition of clothing by unspecified source', N'./images/18.jpg', CAST(N'2021-09-25' AS Date), CAST(N'2022-10-10' AS Date), 1, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (19, N'Jazz Piano', 12, 19.6, N'Scoliosis due to radiation', N'./images/19.jpg', CAST(N'2021-10-05' AS Date), CAST(N'2022-10-29' AS Date), 1, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (20, N'Melodic guitar lesson', 8, 7.4, N'Syndactyly of toes with fusion of bone', N'./images/20.jpg', CAST(N'2021-11-01' AS Date), CAST(N'2022-11-20' AS Date), 2, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (21, N'Acoustic guitar', 15, 8.7, N'Malignant neoplasm of pelvis', N'./images/21.jpg', CAST(N'2021-11-29' AS Date), CAST(N'2022-12-10' AS Date), 2, 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image_url], [start_date], [end_date], [category_id], [status]) VALUES (22, N'Complete fingerstyle guitar', 18, 9.5, N'Hepatitis E without mention of hepatic coma', N'./images/22.jpg', CAST(N'2021-12-11' AS Date), CAST(N'2022-12-30' AS Date), 2, 1)

GO

SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__order__30F848ED] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__order__30F848ED]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__account___2F10007B] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__account___2F10007B]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__shipping__300424B4] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__shipping__300424B4]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__categor__267ABA7A] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__categor__267ABA7A]
GO
USE [master]
GO
ALTER DATABASE [ASM_LongNH_FA223W] SET  READ_WRITE 
GO
