USE [MyCmsDB]
GO
/****** Object:  User [Mycms]    Script Date: 12/18/2021 10:35:16 AM ******/
CREATE USER [Mycms] FOR LOGIN [Mycms] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Mycms]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [Mycms]
GO
/****** Object:  Table [dbo].[AdminLogins]    Script Date: 12/18/2021 10:35:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminLogins](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_dbo.AdminLogins] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageComments]    Script Date: 12/18/2021 10:35:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageComments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](200) NULL,
	[WebSite] [nvarchar](200) NULL,
	[Comment] [nvarchar](500) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.PageComments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageGroups]    Script Date: 12/18/2021 10:35:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageGroups](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupTitle] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_dbo.PageGroups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 12/18/2021 10:35:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[ShortDescription] [nvarchar](350) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Visit] [int] NOT NULL,
	[ImageName] [nvarchar](max) NULL,
	[ShowInSlider] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[tag] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Pages] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdminLogins] ON 

INSERT [dbo].[AdminLogins] ([LoginId], [UserName], [Email], [Password]) VALUES (1, N'behnam', N'behnamzare75@gmil.com', N'123456')
INSERT [dbo].[AdminLogins] ([LoginId], [UserName], [Email], [Password]) VALUES (2, N'sepeher', N'sepehr@gmail.com', N'123456')
SET IDENTITY_INSERT [dbo].[AdminLogins] OFF
GO
SET IDENTITY_INSERT [dbo].[PageComments] ON 

INSERT [dbo].[PageComments] ([CommentID], [PageID], [Name], [Email], [WebSite], [Comment], [CreateDate]) VALUES (1, 6, N'بهنام زارع', N'behnamzare75@gmail.com', NULL, N'سلام', CAST(N'2021-12-15T14:04:08.767' AS DateTime))
INSERT [dbo].[PageComments] ([CommentID], [PageID], [Name], [Email], [WebSite], [Comment], [CreateDate]) VALUES (2, 6, N'behnam', N'behnamzare75@gmail.com', NULL, N'good ', CAST(N'2021-12-15T14:15:18.233' AS DateTime))
INSERT [dbo].[PageComments] ([CommentID], [PageID], [Name], [Email], [WebSite], [Comment], [CreateDate]) VALUES (3, 6, N'behnam', N'', NULL, N' goods', CAST(N'2021-12-15T14:19:13.860' AS DateTime))
INSERT [dbo].[PageComments] ([CommentID], [PageID], [Name], [Email], [WebSite], [Comment], [CreateDate]) VALUES (4, 3, N'sepehr eskandari', N'', NULL, N'تست', CAST(N'2021-12-18T09:47:05.747' AS DateTime))
SET IDENTITY_INSERT [dbo].[PageComments] OFF
GO
SET IDENTITY_INSERT [dbo].[PageGroups] ON 

INSERT [dbo].[PageGroups] ([GroupID], [GroupTitle]) VALUES (2, N'ورزشی')
INSERT [dbo].[PageGroups] ([GroupID], [GroupTitle]) VALUES (1002, N'فناوری')
SET IDENTITY_INSERT [dbo].[PageGroups] OFF
GO
SET IDENTITY_INSERT [dbo].[Pages] ON 

INSERT [dbo].[Pages] ([PageID], [GroupID], [Title], [ShortDescription], [Text], [Visit], [ImageName], [ShowInSlider], [CreateDate], [tag]) VALUES (3, 2, N'زنده با بازی بزرگ؛ هواخوری استقلال در صدر', N'مهمترین دیدار هفته دهم لیگ برتر به کام استقلالی ها بود. تیم مجیدی با تحمیل سومین شکست فصل به سپاهان، در صدر جدول رده بندی ایستاد.', N'به گزارش "ورزش سه"، بدون شک می توان دیدار هفته دهم لیگ برتر میان استقلال و سپاهان را حساس ترین بازی هفته نامید. نبردی سخت و نزدیک میان دو تیم مدعی قهرمانی رقابت های امسال که هر دو تیم تنها با هدف کسب 3 امتیاز وارد زمین شدند و هیچ تیمی تمایل نداشت که این بازی به تساوی کشیده شود که همینطور هم شد.

 

استقلال در دیداری که نیمه نخستش سرد و بدون موقعیت دنبال می شد به گل نخست رسید و در نیمه دوم سپاهان تیم برتر میدان بود و موقعیت های زیاد گلزنی را از دست داد هر چند دو فرصت تک به تک و طلایی سلمانی و مطهری می توانست تکلیف برنده را خیلی زودتر مشخص کند و هواداران استقلال نیز استرس زیادی نکشند.', 3, N'f8a06f30-accb-4f82-a1f0-b0ede4987dd8.jpg', 1, CAST(N'2021-12-15T08:57:53.000' AS DateTime), N'ورزش،ورزش3،استقلال')
INSERT [dbo].[Pages] ([PageID], [GroupID], [Title], [ShortDescription], [Text], [Visit], [ImageName], [ShowInSlider], [CreateDate], [tag]) VALUES (5, 2, N'دشمنان کروات و آرژانتینی پرسپولیس!', N'مجید صدری پس از حضور در تجمع مخالفین خود، آنها را به نشستی یک ساعته دعوت کرد تا مشکلات خود را با سرپرست مدیرعاملی باشگاه در میان بگذارند.', N'به گزارش "ورزش سه"، گروهی از طرفداران پرسپولیس پس از فراخوان‌های متعدد در ماه‌های اخیر، سرانجام توانستند تجمعی را در مقابل در وزارت ورزش برگزار کنند و با حضور 300 نفری، اعتراض خود را به صورت خیابانی نشان بدهند. آنها در شعارهای خود علیه حمیدرضا سجادی و مجید صدری موضع‌گیری کردند اما لحظاتی بعد با اتفاقی دور از انتظار و شگفت‌انگیز مواجه شدند: حضور سرپرست مدیرعاملی باشگاه در میان تجمع کنندگان.

 

البته برگزارکنندگان تجمع ترجیح دادند که با شعار علیه صدری، اجازه سخنرانی و صحبت را به او ندهند اما دقایقی بعد برخی از حاضران در تجمع به دعوت مجید صدری، به داخل وزارت ورزش رفتند تا مشکلات خود و دلایل برای این گردهمایی را با او در میان بگذارند.

این نشست یک ساعته در حالی برگزار شد که چند نفر از هواداران داخل اتاق با صدای بلند خواسته‌های خود را مطرح می‌کردند و تلاش داشتند تا حرکت را به صورت شعاری تغییر دهند اما در نهایت اکثریت حاضران تصمیم گرفتند که به شکلی مدنی خواسته‌های خود را با صدری در میان بگذارند تا پاسخش را از وی بگیرند.', 6, N'e29f1ba7-6ee8-4ace-a3d7-56126c18a974.jpg', 1, CAST(N'2021-12-15T09:00:09.000' AS DateTime), N'پرسپولیس')
INSERT [dbo].[Pages] ([PageID], [GroupID], [Title], [ShortDescription], [Text], [Visit], [ImageName], [ShowInSlider], [CreateDate], [tag]) VALUES (6, 2, N'محرومیت 5 ساله برای علی خطیر! (عکس)', N'دبیرکل فدراسیون فوتبال با ابلاغ رای کمیته اخلاق به رئیس سازمان لیگ، خبر از محرومیت عضو هیات مدیره باشگاه تراکتور داد.', N'به گزارش "ورزش سه" ، در هفته‌های گذشته اخبار غیررسمی درباره محرومیت چند مدیر ورزشی مطرح شده بود اما امروز یکی از این محرومان مشخص شد و طبق ابلاغ رأی انجام شده از سوی حسن کامرانی‌فر دبیرکل فدراسیون فوتبال به حیدر بهاروند رئیس سازمان لیگ، علی خطیر معاون ورزشی سابق باشگاه استقلال که به تازگی عضو هیات‌مدیره باشگاه تراکتور نیز شده، با محرومیتی 5 ساله مواجه شده است!

 

علت اعلام این محرومیت علیه خطیر در رأی صادره، نقش مقررا اخلاقی فوتبال اعلام شده است؛ هر چند فرصت یک هفته‌ای در اختیار خطیر قرار داده شده تا بتواند به این رأی اعتراض نماید. در کنار محرومیت پنج ساله از هرگونه فعالیت مرتبط با فوتبال، فوتسال و فوتبال ساحلی، علی خطیر به پرداخت 100 میلیون تومان محکوم شده است.', 19, N'7c518eb5-489d-43de-b7aa-73a670e23296.jpg', 1, CAST(N'2021-12-15T09:01:08.000' AS DateTime), N'محرومیت،استقلال')
INSERT [dbo].[Pages] ([PageID], [GroupID], [Title], [ShortDescription], [Text], [Visit], [ImageName], [ShowInSlider], [CreateDate], [tag]) VALUES (1002, 1002, N'چگونه به عنوان یک برنامه نویس درآمد بیشتری داشته باشیم؟', N'آیا شما هم علاقه مند به افزایش درآمد خود به عنوان یک برنامه نویس هستید؟ در این مطلب درباره استراتژی های افزایش درآمد برای برنامه نویسان صحبت می کنیم.', N'<div class="heading" style="box-sizing: border-box; padding-bottom: 7px; position: relative; z-index: 1; color: rgb(30, 47, 56); font-family: IRANSansWeb, tahoma; font-size: 14px; word-spacing: -1px; margin-bottom: 25px !important;">
<h2 style="text-align:justify"><a href="https://toplearn.com/blog/3364/-%DA%86%DA%AF%D9%88%D9%86%D9%87-%D8%A8%D9%87-%D8%B9%D9%86%D9%88%D8%A7%D9%86-%DB%8C%DA%A9-%D8%A8%D8%B1%D9%86%D8%A7%D9%85%D9%87-%D9%86%D9%88%DB%8C%D8%B3-%D8%AF%D8%B1%D8%A2%D9%85%D8%AF-%D8%A8%DB%8C%D8%B4%D8%AA%D8%B1%DB%8C-%D8%AF%D8%A7%D8%B4%D8%AA%D9%87-%D8%A8%D8%A7%D8%B4%DB%8C%D9%85%D8%9F-" style="box-sizing: border-box; background-color: transparent; color: rgb(30, 47, 56); text-decoration-line: none; display: inline-block; transition: all 0.2s linear 0s; outline: 0px !important;">چگونه به عنوان یک برنامه نویس درآمد بیشتری داشته باشیم؟</a></h2>
</div>

<p style="text-align:justify">آیا شما هم علاقه مند به افزایش درآمد خود به عنوان یک برنامه نویس هستید؟ در این مطلب درباره استراتژی های افزایش درآمد برای برنامه نویسان صحبت می کنیم.</p>

<p style="text-align:justify">برنامه نویس بودن می تواند برای هر کسی فوق العاده باشد. در این شغل نه تنها شما اکثر مواقع سرگرم هستید بلکه فرصت های شغلی زیادی برای شما وجود دارد که اکثر آنها نیز دارای حقوق و درآمد بالایی هستند. با این حال برخی از مواقع ممکن است شما نیاز به درآمد بیشتری داشته باشید. ممکن است شما در دوران تحصیل خود باشید و به جای این که در یک شرکت استخدام شوید علاقه مند هستید تا به عنوان یک برنامه نویس برای خودتان کار کنید یا این که ممکن است یک فرزند داشته باشید و علاقه مند باشید تا زمان بیشتری را با او بگذرانید و به همین علت نمی توانید در شرکت ها کار کنید و باید برای خودتان کار کنید. شما به عنوان یک برنامه نویس هرآنچه که برای افزایش درآمد نیاز دارید را در اختیار دارید. مغزتان، لپ تاپ و اینترنت تنها چیزهایی هستند که شما به آنها نیاز دارید. برای افزایش درآمد برنامه نویسی می توانید استراتژی هایی که در ادامه بیان می کنیم را بررسی کنید تا متوجه شوید که کدام یک می توانند برای شما گزینه بهتری باشند.</p>

<h2 style="text-align:justify"><strong>به عنوان یک برنامه نویس، فریلنسری را آغاز کنید</strong></h2>

<p style="text-align:justify">فریلنسرینگ می تواند برای شما بسیار مفید باشد. شما می توانید بدون داشتن یک رئیس برای خودتان کار کنید، تعداد زیادی پروژه وجود دارد که می توانید هر یک از آنها را انتخاب کنید، افرادی که تخصص زیادی دارند معمولا درآمد زیادی نیز از این طریق به دست می آورند، شما می توانید تعطیلات زیادی در طول سال داشته باشید و بسیاری از مزایای دیگر که باعث می شود تا فریلنسینگ یک شغل بسیار مفید باشد.</p>

<p style="text-align:justify">با این حال شما برای پیدا کردن مشتری و پروژه جدید باید نظم و انضباط زیادی داشته باشید. یکی از بزرگ ترین مزایای این شغل این است که شما می توانید در کنار شغل اصلی خود در زمان های آزادی که دارید یا در تعطیلات پروژه انجام دهید.</p>

<p><img src="https://toplearn.com/img/editor/e52c4111db164f87bc1ab8f39a0becce.jpg" style="border:0px; box-sizing:border-box; height:auto !important; max-width:100%; vertical-align:middle; width:764.656px" /></p>

<h2 style="text-align:justify"><strong>کار روی پروفایل لینکدین</strong></h2>

<p style="text-align:justify">یک استراتژی بهتر برای شروع کار به عنوان یک فریلنسر این است که روی پروفایل لینکدین خود کار کنید. سعی کنید با استخدام کنندگان و مشتریان قبلی خود ارتباط بگیرید، در کنفرانس ها و جلسات مختلف شرکت کنید و به دنبال پلتفرم هایی باشید که امکان کار کردن از راه دور را برای شما فراهم می کنند.</p>

<p><img src="https://toplearn.com/img/editor/d94fea873e6348559acac13cc5d4ef0e.jpg" style="border:0px; box-sizing:border-box; height:auto !important; max-width:100%; vertical-align:middle; width:764.656px" /></p>

<h2 style="text-align:justify"><strong>در مسابقات کدنویسی شرکت کنید</strong></h2>

<p style="text-align:justify">بله این موضوع کاملا واقعی است. پلتفرم های اختصاصی وجود دارند که مسابقات برنامه نویسی را با جایزه های واقعی برگزار می کنند. یکی از بزرگترین این پلتفرم ها پلتفرم Topcoder است که بیش از یک میلیون عضو دارد و هر ساله مسابقات زیادی را در این زمینه برگزار می کند. این پلتفرم دارای سه محور اصلی طراحی، توسعه و علم داده است.</p>

<p style="text-align:justify">شما می توانید روی پروژه های واقعی کار کنید که توسط بیش از 2000 نفر دیگر نیز انجام می شوند یا این که می توانید در مسابقات تک نفره شرکت کنید و با حریفان خود رقابت کنید. این کار به شما تضمین می دهد که منحنی یادگیری خود را بهبود دهید و خیلی سریع مهارت های خود را بهبود دهید.</p>

<p style="text-align:justify">اگر به چالش های برنامه نویسی علاقه مند هستید این مسابقات می توانند برای شما بسیار جذاب و هیجان انگیز باشند. با این حال نباید فراموش کنید که این مسابقات دارای رقابت شدیدی هستند و شما نمی توانید انتظار درآمد ثابتی از آنها داشته باشید.</p>

<p><img src="https://toplearn.com/img/editor/444d94b41a7a44c9a84386719d59634b.jpg" style="border:0px; box-sizing:border-box; height:auto !important; max-width:100%; vertical-align:middle; width:764.656px" /></p>

<h2 style="text-align:justify"><strong>نوشتن مطلب را آغاز کنید</strong></h2>

<p style="text-align:justify">نوشتن مطلب می تواند یکی از بهترین راه ها برای رسیدن به مخاطبان گسترده باشد. فرصت های زیادی برای شروع نوشتن مطلب و کسب درآمد از این طریق وجود دارد که از جمله آنها می توان به موارد زیر اشاره کرد:</p>

<p style="text-align:justify">-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; می توانید وبلاگ خود را راه اندازی کنید و با استفاده از تبلیغات اقدام به کسب درآمد کنید.</p>

<p style="text-align:justify">-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; می توانید کتاب یا کتاب الکترونیکی بنویسید و آنها را به صورت رایگان بفروشید.</p>

<p style="text-align:justify">-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; می توانید در برخی پلتفرم ها مطلب بنویسید و در پلتفرم های مشارکتی آنها شرکت کنید.</p>

<p style="text-align:justify">-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; می توانید در سایت های استخدام به صورت مهمان پست ایجاد کنید. در صورت قبول شدن محتوای شما این سایت ها معمولا درآمد خوبی دارند.</p>

<p style="text-align:justify">هیچ اشکالی ندارد که همه چیز را امتحان کنید و ببینید مردم چگونه به آنچه که می نویسید واکنش نشان می دهند. امروزه بسیاری از برنامه نویسان در پلتفرم های مختلف مطلب می نویسند و درآمد خوبی کسب می&zwnj;کنند.</p>

<p style="text-align:justify">با این حال نباید فراموش کنید که شما حتما باید در زمینه ای مطلب بنویسید که به آن علاقه دارید (این امر باعث می شود تا شما با انگیزه بمانید). سعی کنید به طور مداوم به نوشتن ادامه دهید و روز به روز مهارت های نوشتاری خود را ارتقاء دهید. نوشتن مقالات باکیفیت به شما کمک می کند تا بتوانید بازدید مطالب خود را چندین برابر کنید.</p>

<p><img src="https://toplearn.com/img/editor/216343aedf684712a51d65c08639692b.jpg" style="border:0px; box-sizing:border-box; height:auto !important; max-width:100%; vertical-align:middle; width:764.656px" /></p>

<h2 style="text-align:justify"><strong>ضبط و فروش دوره های آنلاین</strong></h2>

<p style="text-align:justify">توانایی آموزش آنلاین به افراد یکی از مهم ترین مهارت هایی است که شما می توانید به عنوان برنامه نویس داشته باشید. این مهارت ها در سال های اخیر ظهور پیدا کرده اند و حداقل یک دهه دیگر نیز ادامه پیدا خواهند کرد.</p>

<p style="text-align:justify">مزایای این دوره ها هم برای دانش آموزان و هم برای معلمان است. دانشجویان می توانند از میان طیف گسترده ای از انتخاب هایی که دارند بهترین گزینه را انتخاب کنند و مدرسان نیز می توانند با استفاده از این دوره ها درآمدزایی کنند.</p>

<p style="text-align:justify">اگر شما به عنوان یک برنامه نویس تجربه یا دانش تخصصی در زمینه جاوا اسکریپت، پایتون یا هر زبان و فریم ورک دیگری دارید می توانید به دیگران آموزش دهید و از این مسئله نهایت لذت را ببرید. ایجاد دوره های آنلاین و فروش آنها می تواند درآمد خوبی را برای شما داشته باشد.</p>

<p style="text-align:justify">پلتفرم های زیادی برای انتشار این دوره ها وجود دارند که از جمله معروف ترین آنها می توان به سایت udemy اشاره کرد. این سایت دارای 75 میلیون بازدید در ماه است و می تواند یکی از بهترین گزینه ها برای انتشار دوره شما باشد. البته پلتفرم های داخلی دیگری نیز وجود دارند که شما می توانید از آنها استفاده کنید.</p>

<p><img src="https://toplearn.com/img/editor/34172b4b79364e53b1668395a6e675af.jpg" style="border:0px; box-sizing:border-box; height:auto !important; max-width:100%; vertical-align:middle; width:764.656px" /></p>

<h2 style="text-align:justify"><strong>نکاتی مهم برای ضبط دوره به عنوان یک برنامه نویس</strong></h2>

<p style="text-align:justify">در زمان ضبط دوره های خود به عنوان یک برنامه نویس حتما به نکات زیر توجه داشته باشید:</p>

<p style="text-align:justify">-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; روی تجهیزات خوب سرمایه گذاری کنید: سعی کنید میکروفن و وبکم خوبی را برای خود خریداری کنید.</p>

<p style="text-align:justify">-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; محتوایی که کیفیت بالایی داشته باشد برنده است. امروزه رقابت در این زمینه به میزان زیادی افزایش پیدا کرده است، بنابراین شما باید کاربران را متقاعد کنید که می توانید چیزهای خوبی را به آنها آموزش دهید.</p>

<p style="text-align:justify">-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; صحبت کردن با صدای بلند و واضح را تمرین کنید.</p>

<p style="text-align:justify">-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; سعی کنید علاوه بر مطالب آموزشی فایل های پروژه های مختلف، یادداشت ها و ... را نیز به کاربران خود ارائه دهید.</p>

<p style="text-align:justify">-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; سعی کنید به صورت مرتب دوره های خود را به روز کنید.</p>

<p><img src="https://toplearn.com/img/editor/fa486c364c924b76a661c43f46517b49.png" style="border:0px; box-sizing:border-box; height:auto !important; max-width:100%; vertical-align:middle; width:764.656px" /></p>

<h2 style="text-align:justify"><strong>پادکست های برنامه نویسی بسازید</strong></h2>

<p style="text-align:justify">بسیاری از مردم دوست ندارند که جلوی دوربین باشند ولی در یک زمینه خاص تخصص زیادی دارند و علاقه مند هستند تا دانش خود را با سایر افراد نیز به اشتراک بگذارند.</p>

<p style="text-align:justify">بدون شک پادکست ها یک رسانه عالی برای انجام این کار هستند. با وجود آن که پادکست ها چندین سال است که وجود دارند ولی در چهار الی پنج سال اخیر محبوبیت زیادی را به دست آورده اند. امروزه میلیون ها نفر زمانی که صبح ها به محل کار خود می روند یا این که شب ها به خانه خود باز می گردند به پادکست گوش می دهند.</p>

<p><img src="https://toplearn.com/img/editor/106414d608ef4c438b8707b5caaea0e9.jpg" style="border:0px; box-sizing:border-box; height:auto !important; max-width:100%; vertical-align:middle; width:764.656px" /></p>

<h2 style="text-align:justify"><strong>نکاتی مهم درباره پادکست ها برای یک برنامه نویس</strong></h2>

<p style="text-align:justify">امروزه بیشتر پادکست هایی که وجود دارند به صورت رایگان نیز قابل دسترس هستند. پلتفرم های مختلفی وجود دارند که پادکست های شما را منتشر کرده و براساس میزان محبوبیت آنها هزینه ای را به شما پرداخت می کنند. برای موفقیت در یک پادکست شما باید بتوانید خودتان را به خوبی بیان کنید. سعی کنید روی تجهیزات صوتی خود سرمایه گذاری کنید و میکروفن خوبی را برای خودتان خریداری کنید. علاوه بر این داشتن استقامت در ضبط پادکست ها نیز می تواند برای شما بسیار مفید و کاربردی باشد. توجه کنید این کاملا عادی است که شما برای یک یا دو سال به صورت هفتگی پادکست های خود را ضبط کنید تا در نهایت بتوانید با استفاده از نظرتان شنوندگان خود کیفیت پادکست هایتان را بهبود دهید.</p>

<p><img src="https://toplearn.com/img/editor/75829b27b393458ca0e777b3b42062ee.jpg" style="border:0px; box-sizing:border-box; height:auto !important; max-width:100%; vertical-align:middle; width:764.656px" /></p>

<h2 style="text-align:justify"><strong>صحبت پایانی</strong></h2>

<p style="text-align:justify">برای داشتن درآمد بالا به عنوان یک برنامه نویس مهم نیست که از کدام روش استفاده کنید. شما باید استراتژی که انتخاب می کنید را دنبال کرده و در آن استقامت داشته باشید. با صرف زمان و انرژی کافی در 99 درصد مواقع شما می توانید موفق شوید و درآمد اضافی را به عنوان یک برنامه نویس داشته باشید و از زندگی خود لذت ببرید.</p>
', 1, N'5df5a466-efbe-4e89-b9e6-c8e5c2ef05ff.png', 1, CAST(N'2021-12-16T23:53:13.910' AS DateTime), N'تاپ لرن،بلاگ تاپ لرن،چگونه به عنوان یک برنامه نویس درآمد بیشتری داشته باشیم؟')
SET IDENTITY_INSERT [dbo].[Pages] OFF
GO
ALTER TABLE [dbo].[PageComments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PageComments_dbo.Pages_PageID] FOREIGN KEY([PageID])
REFERENCES [dbo].[Pages] ([PageID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PageComments] CHECK CONSTRAINT [FK_dbo.PageComments_dbo.Pages_PageID]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Pages_dbo.PageGroups_GroupID] FOREIGN KEY([GroupID])
REFERENCES [dbo].[PageGroups] ([GroupID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_dbo.Pages_dbo.PageGroups_GroupID]
GO
