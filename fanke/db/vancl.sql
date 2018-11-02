SET NAMES UTF8;
DROP DATABASE IF EXISTS vancl;
CREATE DATABASE vancl CHARSET=UTF8;
USE vancl;


/**衣服分类-男装-女装-大衣-西服...**/
CREATE TABLE v_clothes_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

/**衣服产品**/
CREATE TABLE v_clothes(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属分类编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  price DECIMAL(10,2),        #价格
  promise VARCHAR(64),        #服务承诺
  spec VARCHAR(64),           #规格/颜色
  lname VARCHAR(32),          #商品名称
  os VARCHAR(32),             #尺码
  memory VARCHAR(32),         #尺码
  resolution VARCHAR(32),     #尺码
  video_card VARCHAR(32),     #尺码
  cpu VARCHAR(32),						#尺码
  video_memory VARCHAR(32),   #尺码
  category VARCHAR(32),       #所属分类
  disk VARCHAR(32),           
  details VARCHAR(1024),      #产品详细说明
  shelf_time BIGINT,          #上架时间
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);

/**衣服图片**/
CREATE TABLE v_clothes_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  clothes_id INT,              #衣服编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);

/**用户信息**/
CREATE TABLE v_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),
  avatar VARCHAR(128),        
  user_name VARCHAR(32),     
  gender INT                  
);

/**收货地址信息**/
CREATE TABLE v_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

/**购物车条目**/
CREATE TABLE v_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN, #是否已勾选，确定购买
	clothes_size varchar(10)
);

/**用户订单**/
CREATE TABLE v_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE v_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);

/****首页轮播广告商品****/
CREATE TABLE v_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);

/****首页商品****/
CREATE TABLE v_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

/*******************/
/******数据导入******/
/*******************/
/**服装分类家族**/
INSERT INTO v_clothes_family VALUES
(NULL,'女装'),
(NULL,'男装'),
(NULL,'大衣'),
(NULL,'西服'),
(NULL,'休闲'),
(NULL,'商务'),
(NULL,'夹克'),
(NULL,'运动'),
(NULL,'亚麻');

/**衣服详情**/
INSERT INTO v_clothes VALUES
(1,1,'羊毛大衣 手工面料 圆领 女 ','2017 初冬新品 倾情上市','1699','*退货补运费 *30天无忧退货 *48小时快速退款 ','深蓝色','大衣','XL','XXL','XXXL','null','null','其它','null','null','null',150123456789,12968,true),
(2,1,'羊毛大衣 手工面料 圆领 女 ','2017 初冬新品 倾情上市','2699','*退货补运费 *30天无忧退货 *48小时快速退款 ','酒红色','大衣','XL','XXL','','null','null','其它','null','null','null',150123456789,11968,true),
(3,1,'牛津纺 手工面料 圆领 女 ','2017 初冬新品 倾情上市','3699','*退货补运费 *30天无忧退货 *48小时快速退款','墨绿色','大衣','XL','','','null','null','其它','null','null','null',150123456789,9688,true),
(4,1,'牛津纺 手工面料 圆领 女 ','2017 初冬新品 倾情上市','2699','*退货补运费 *30天无忧退货 *48小时快速退款 ','咖啡色','大衣','XL','XXL','XXXL','null','null','其它','null','null','null',150123456789,8968,true),
(5,1,'羊毛大衣 手工面料 圆领 女 ','2017 初冬新品 倾情上市','1699','*退货补运费 *30天无忧退货 *48小时快速退款','粉色','大衣','L','XL','XXL','null','null','其它','null','null','null',150123456789,7968,true),
(6,1,'羊毛大衣 手工面料 圆领 女 ','2017 初冬新品 倾情上市','3699','*退货补运费 *30天无忧退货 *48小时快速退款','淡黄色','大衣','XL','XXL','XXXL','null','null','其它','null','null','null',150123456789,7768,true),
(7,2,'牛津纺 手工面料 立领 男 ','2017 初冬新品 倾情上市','699','*退货补运费 *30天无忧退货 *48小时快速退款','黑色','大衣','XL','XXL','XXXL','null','null','其它','null','null','null',150123456789,6968,true),
(8,2,'牛津纺 手工面料 立领 男 ','2017 初冬新品 倾情上市','699','*退货补运费 *30天无忧退货 *48小时快速退款','咖啡色','大衣','XL','XXL','XXXL','null','null','其它','null','null','null',150123456789,6668,true),
(9,2,'牛津纺 手工面料 立领 男 ','2017 初冬新品 倾情上市','299','*退货补运费 *30天无忧退货 *48小时快速退款','深蓝色','大衣','XL','XXL','','null','null','其它','null','null','null',150123456789,7968,true),
(10,2,'牛津纺 手工面料 立领 男 ','2017 初冬新品 倾情上市','299','*退货补运费 *30天无忧退货 *48小时快速退款','花灰色','大衣','XXL','XXL','','null','null','其它','null','null','null',150123456789,6968,true),
(11,2,'羊毛大衣 手工面料 有帽 男 ','2017 初冬新品 倾情上市','299','*退货补运费 *30天无忧退货 *48小时快速退款','墨绿色','大衣','L','XXL','XXXL','null','null','其它','null','null','null',150123456789,5968,true),
(12,2,'羊毛大衣 手工面料 有帽 男 ','2017 初冬新品 倾情上市','299','*退货补运费 *30天无忧退货 *48小时快速退款','海蓝色','大衣','XL','XXL','XXXL','null','null','其它','null','null','null',150123456789,5568,true),
(13,3,'牛津纺 手工面料 圆领 男 ','2017 初冬新品 倾情上市','299','*退货补运费 *30天无忧退货 *48小时快速退款','深蓝色','大衣','L','XL','XXL','null','null','其它','null','null','null',150123456789,4968,true),
(14,3,'牛津纺 手工面料 圆领 男 ','2017 初冬新品 倾情上市','299','*退货补运费 *30天无忧退货 *48小时快速退款','咖啡色','大衣','XL','XXL','','null','null','其它','null','null','null',150123456789,2968,true),
(15,3,'羊毛大衣 手工面料 圆领 男 ','2017 初冬新品 倾情上市','299','*退货补运费 *30天无忧退货 *48小时快速退款','墨绿色','大衣','XL','XXL','XXXL','null','null','其它','null','null','null',150123456789,2968,true),
(16,3,'羊毛大衣 手工面料 圆领 男 ','2017 初冬新品 倾情上市','299','*退货补运费 *30天无忧退货 *48小时快速退款','酒红色','大衣','XL','XXL','','null','null','其它','null','null','null',150123456789,2968,true),
(17,3,'大衣 手工面料 圆领  ','2017 初冬新品 倾情上市','199','*退货补运费 *30天无忧退货 *48小时快速退款','深蓝色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(18,3,'手工面料 圆领 儿童 ','2017 初冬新品 倾情上市','199','*退货补运费 *30天无忧退货 *48小时快速退款','酒红色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(19,3,'大衣 手工面料 圆领  ','2017 初冬新品 倾情上市','199','*退货补运费 *30天无忧退货 *48小时快速退款','墨绿色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(20,3,'大衣 手工面料 圆领 ','2017 初冬新品 倾情上市','199','*退货补运费 *30天无忧退货 *48小时快速退款','咖啡色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(21,3,'大衣 手工面料 圆领 ','2017 初冬新品 倾情上市','199','*退货补运费 *30天无忧退货 *48小时快速退款','深蓝色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(22,3,'大衣 手工面料 圆领 ','2017 初冬新品 倾情上市','199','*退货补运费 *30天无忧退货 *48小时快速退款','酒红色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(23,3,'大衣 手工面料 圆领 ','2017 初冬新品 倾情上市','199','*退货补运费 *30天无忧退货 *48小时快速退款','墨绿色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(24,3,'大衣 手工面料 圆领  ','2017 初冬新品 倾情上市','199','*退货补运费 *30天无忧退货 *48小时快速退款','咖啡色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(25,4,'羊毛大衣 手工面料 圆领 ','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','深蓝色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(26,4,'羊毛大衣 手工面料 圆领 ','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','酒红色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(27,4,'羊毛大衣 手工面料 圆领 ','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','墨绿色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(28,4,'羊毛大衣 手工面料 圆领','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','咖啡色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(29,4,'羊毛大衣 手工面料 圆领 ','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','深蓝色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(30,4,'羊毛大衣 手工面料 圆领 ','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','酒红色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(31,4,'羊毛大衣 手工面料 圆领 ','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','咖啡色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(32,4,'羊毛大衣 手工面料 圆领','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','墨绿色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(33,5,'衬衫手工面料 圆领 ','2017 初冬新品 倾情上市','199','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','深蓝色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(34,5,'手工面料 圆领 儿童 ','2017 初冬新品 倾情上市','199','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','酒红色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(35,5,'衬衫 手工面料 圆领 ','2017 初冬新品 倾情上市','199','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','墨绿色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(36,5,'衬衫 手工面料 圆领  ','2017 初冬新品 倾情上市','199','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','咖啡色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(37,5,'衬衫 手工面料 圆领 ','2017 初冬新品 倾情上市','199','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','深蓝色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(38,5,'衬衫 手工面料 圆领 ','2017 初冬新品 倾情上市','199','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','酒红色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(39,5,'衬衫 手工面料 圆领 ','2017 初冬新品 倾情上市','199','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','墨绿色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(40,5,'衬衫 手工面料 圆领  ','2017 初冬新品 倾情上市','199','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','咖啡色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(41,6,'羊毛大衣 手工面料 圆领 ','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','深蓝色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(42,6,'羊毛大衣 手工面料 圆领 ','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','酒红色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(43,6,'羊毛大衣 手工面料 圆领 ','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','墨绿色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(44,6,'羊毛大衣 手工面料 圆领','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','咖啡色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(45,6,'羊毛大衣 手工面料 圆领 ','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','深蓝色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(46,7,'羊毛大衣 手工面料 圆领 ','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','酒红色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(47,7,'羊毛大衣 手工面料 圆领 ','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','咖啡色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(48,7,'羊毛大衣 手工面料 圆领','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','墨绿色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(49,7,'羊毛大衣 手工面料 圆领 ','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','咖啡色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true),
(50,7,'羊毛大衣 手工面料 圆领','2017 初冬新品 倾情上市','599','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','墨绿色','大衣','XL','null','null','null','null','其它','null','null','null',150123456789,2968,true);

/**衣服图片**/
INSERT INTO v_clothes_pic VALUES
(NULL, 1,'img/product/sm/6375443-1j201710131550493576.jpg','img/product/md/6375443-1j201710131550493576.jpg','img/product/lg/6375443-1j201710131550493576.jpg'),
(NULL, 1,'img/product/sm/6375443-2201710131550493576.jpg','img/product/md/6375443-2201710131550493576.jpg','img/product/lg/6375443-2201710131550493576.jpg'),
(NULL, 1,'img/product/sm/6375443-5201611021701149855.jpg','img/product/md/6375443-5201611021701149855.jpg','img/product/lg/6375443-5201611021701149855.jpg'),
(NULL, 1,'img/product/sm/6375443-6201611021701149855.jpg','img/product/md/6375443-6201611021701149855.jpg','img/product/lg/6375443-6201611021701149855.jpg'),
(NULL, 1,'img/product/sm/6375443-7201611021701149855.jpg','img/product/md/6375443-7201611021701149855.jpg','img/product/lg/6375443-7201611021701149855.jpg'),
(NULL, 1,'img/product/sm/6375443-8201611021701149855.jpg','img/product/md/6375443-8201611021701149855.jpg','img/product/lg/6375443-8201611021701149855.jpg'),
(NULL, 1,'img/product/sm/6375443-9201611021701149855.jpg','img/product/md/6375443-9201611021701149855.jpg','img/product/lg/6375443-9201611021701149855.jpg'),
(NULL, 2,'img/product/sm/6375218-1j201710130915288969.jpg','img/product/md/6375218-1j201710130915288969.jpg','img/product/lg/6375218-1j201710130915288969.jpg'),
(NULL, 2,'img/product/sm/6375218-03201610261056430813.jpg','img/product/md/6375218-03201610261056430813.jpg','img/product/lg/6375218-03201610261056430813.jpg'),
(NULL, 2,'img/product/sm/6375218-04201610261056430813.jpg','img/product/md/6375218-04201610261056430813.jpg','img/product/lg/6375218-04201610261056430813.jpg'),
(NULL, 2,'img/product/sm/6375218-05201610261056430813.jpg','img/product/md/6375218-05201610261056430813.jpg','img/product/lg/6375218-05201610261056430813.jpg'),
(NULL, 2,'img/product/sm/6375218-06201610261056430813.jpg','img/product/md/6375218-06201610261056430813.jpg','img/product/lg/6375218-06201610261056430813.jpg'),
(NULL, 2,'img/product/sm/6375218-07201610261056430813.jpg','img/product/md/6375218-07201610261056430813.jpg','img/product/lg/6375218-07201610261056430813.jpg'),
(NULL, 2,'img/product/sm/6375218-2201710130915288969.jpg','img/product/md/6375218-2201710130915288969.jpg','img/product/lg/6375218-2201710130915288969.jpg'),
(NULL, 3,'img/product/sm/6375445-1j201710130915289125.jpg','img/product/md/6375445-1j201710130915289125.jpg','img/product/lg/6375445-1j201710130915289125.jpg'),
(NULL, 3,'img/product/sm/6375445-03201611021648501258.jpg','img/product/md/6375445-03201611021648501258.jpg','img/product/lg/6375445-03201611021648501258.jpg'),
(NULL, 3,'img/product/sm/6375445-2201710130915289125.jpg','img/product/md/6375445-2201710130915289125.jpg','img/product/lg/6375445-2201710130915289125.jpg'),
(NULL, 3,'img/product/sm/6375445-06201611021648501258.jpg','img/product/md/6375445-06201611021648501258.jpg','img/product/lg/6375445-06201611021648501258.jpg'),
(NULL, 3,'img/product/sm/6375445-07201611021648501258.jpg','img/product/md/6375445-07201611021648501258.jpg','img/product/lg/6375445-07201611021648501258.jpg'),
(NULL, 3,'img/product/sm/6375445-09201611021648501258.jpg','img/product/md/6375445-09201611021648501258.jpgg','img/product/lg/6375445-09201611021648501258.jpg'),
(NULL, 3,'img/product/sm/6375445-05201611021648501258.jpg','img/product/md/6375445-05201611021648501258.jpg','img/product/lg/6375445-05201611021648501258.jpg'),
(NULL, 4,'img/product/sm/6375450-1j201710130915288969.jpg','img/product/md/6375450-1j201710130915288969.jpg','img/product/lg/6375450-1j201710130915288969.jpg'),
(NULL, 4,'img/product/sm/6375450-2201710130915288969.jpg','img/product/md/6375450-2201710130915288969.jpg','img/product/lg/6375450-2201710130915288969.jpg'),
(NULL, 4,'img/product/sm/6375450-5201611021658200166.jpg','img/product/md/6375450-5201611021658200166.jpg','img/product/lg/6375450-5201611021658200166.jpg'),
(NULL, 5,'img/product/sm/6375451-1j201710130915290844.jpg','img/product/md/6375451-1j201710130915290844.jpg','img/product/lg/6375451-1j201710130915290844.jpg'),
(NULL, 5,'img/product/sm/6375451-10201611021629151001.jpg','img/product/md/6375451-10201611021629151001.jpg','img/product/lg/6375451-10201611021629151001.jpg'),
(NULL, 5,'img/product/sm/6375451-2201710130915290844.jpg','img/product/md/6375451-2201710130915290844.jpg','img/product/lg/6375451-2201710130915290844.jpg'),
(NULL, 5,'img/product/sm/6375451-5201611021629151001.jpg','img/product/md/6375451-5201611021629151001.jpg','img/product/lg/6375451-5201611021629151001.jpg'),
(NULL, 5,'img/product/sm/6375451-6201611021629151001.jpg','img/product/md/6375451-6201611021629151001.jpg','img/product/lg/6375451-6201611021629151001.jpg'),
(NULL, 5,'img/product/sm/6375451-7201611021629151001.jpg','img/product/md/6375451-7201611021629151001.jpg','img/product/lg/6375451-7201611021629151001.jpg'),
(NULL, 6,'img/product/sm/6379027-1j201711101839399639.jpg','img/product/md/6379027-1j201711101839399639.jpg','img/product/lg/6379027-1j201711101839399639.jpg'),
(NULL, 6,'img/product/sm/6379027-10201711101839399639.jpg','img/product/md/6379027-10201711101839399639.jpg','img/product/lg/6379027-10201711101839399639.jpg'),
(NULL, 6,'img/product/sm/6379027-11201711101839399639.jpg','img/product/md/6379027-11201711101839399639.jpg','img/product/lg/6379027-11201711101839399639.jpg'),
(NULL, 6,'img/product/sm/6379027-12201711101839399639.jpg','img/product/md/6379027-12201711101839399639.jpg','img/product/lg/6379027-12201711101839399639.jpg'),
(NULL, 6,'img/product/sm/6379027-13201711101839399639.jpg','img/product/md/6379027-13201711101839399639.jpg','img/product/lg/6379027-13201711101839399639.jpg'),
(NULL, 6,'img/product/sm/6379027-5201711101839399639.jpg','img/product/md/6379027-5201711101839399639.jpg','img/product/lg/6379027-5201711101839399639.jpg'),
(NULL, 6,'img/product/sm/6379027-6201711101839399639.jpg','img/product/md/6379027-6201711101839399639.jpg','img/product/lg/6379027-6201711101839399639.jpg'),
(NULL, 6,'img/product/sm/6379027-7201711101839399639.jpg','img/product/md/6379027-7201711101839399639.jpg','img/product/lg/6379027-7201711101839399639.jpg'),
(NULL, 6,'img/product/sm/6379027-8201711101839399639.jpg','img/product/md/6379027-8201711101839399639.jpg','img/product/lg/6379027-8201711101839399639.jpg'),
(NULL, 7,'img/product/sm/6375214-1j201709151925388161.jpg','img/product/md/6375214-1j201709151925388161.jpg','img/product/lg/6375214-1j201709151925388161.jpg'),
(NULL, 7,'img/product/sm/6375214-03201610261055283620.jpg','img/product/md/6375214-03201610261055283620.jpg','img/product/lg/6375214-03201610261055283620.jpg'),
(NULL, 7,'img/product/sm/6375214-04201610261055283620.jpg','img/product/md/6375214-04201610261055283620.jpg','img/product/lg/6375214-04201610261055283620.jpg'),
(NULL, 7,'img/product/sm/6375214-05201610261055283620.jpg','img/product/md/6375214-05201610261055283620.jpg','img/product/lg/6375214-05201610261055283620.jpg'),
(NULL, 7,'img/product/sm/6375214-2201709151925388161.jpg','img/product/md/6375214-2201709151925388161.jpg','img/product/lg/6375214-2201709151925388161.jpg'),
(NULL, 8,'img/product/sm/6375440-1j201709151926140815.jpg','img/product/md/6375440-1j201709151926140815.jpg','img/product/lg/6375440-1j201709151926140815.jpg'),
(NULL, 8,'img/product/sm/6375440-03201611031245212350.jpg','img/product/md/6375440-03201611031245212350.jpg','img/product/lg/6375440-03201611031245212350.jpg'),
(NULL, 8,'img/product/sm/6375440-2201709151926140815.jpg','img/product/md/6375440-2201709151926140815.jpg','img/product/lg/6375440-2201709151926140815.jpg'),
(NULL, 9,'img/product/sm/6377996-1j201710121408227197.jpg','img/product/md/6377996-1j201710121408227197.jpg','img/product/lg/6377996-1j201710121408227197.jpg'),
(NULL, 9,'img/product/sm/6377996-5201710121434427010.jpg','img/product/md/6377996-5201710121434427010.jpg','img/product/lg/6377996-5201710121434427010.jpg'),
(NULL, 9,'img/product/sm/6377996-6201710121434457010.jpg','img/product/md/6377996-6201710121434457010.jpg','img/product/lg/6377996-6201710121434457010.jpg'),
(NULL, 9,'img/product/sm/6377996-10201710121434427010.jpg','img/product/md/6377996-10201710121434427010.jpg','img/product/lg/6377996-10201710121434427010.jpg'),
(NULL, 9,'img/product/sm/6377996-7201710121434457010.jpg','img/product/md/6377996-7201710121434457010.jpg','img/product/lg/6377996-7201710121434457010.jpg'),
(NULL, 9,'img/product/sm/6377996-9201710121434457010.jpg','img/product/md/6377996-9201710121434457010.jpg','img/product/lg/6377996-9201710121434457010.jpg'),
(NULL, 10,'img/product/sm/6377998-1j201710121408227822.jpg','img/product/md/6377998-1j201710121408227822.jpg','img/product/lg/6377998-1j201710121408227822.jpg'),
(NULL, 10,'img/product/sm/6377998-5201710121435374361.jpg','img/product/md/6377998-5201710121435374361.jpg','img/product/lg/6377998-5201710121435374361.jpg'),
(NULL, 10,'img/product/sm/6377998-6201710121435374361.jpg','img/product/md/6377998-6201710121435374361.jpg','img/product/lg/6377998-6201710121435374361.jpg'),
(NULL, 11,'img/product/sm/6378284-1j201711031613492136.jpg','img/product/md/6378284-1j201711031613492136.jpg','img/product/lg/6378284-1j201711031613492136.jpg'),
(NULL, 11,'img/product/sm/6378284-2201711031613492136.jpg','img/product/md/6378284-2201711031613492136.jpg','img/product/lg/6378284-2201711031613492136.jpg'),
(NULL, 11,'img/product/sm/6378284-5201710251032410198.jpg','img/product/md/6378284-5201710251032410198.jpg','img/product/lg/6378284-5201710251032410198.jpg'),
(NULL, 11,'img/product/sm/6378284-6201710251032410198.jpg','img/product/md/6378284-6201710251032410198.jpg','img/product/lg/6378284-6201710251032410198.jpg'),
(NULL, 11,'img/product/sm/6378284-10201710251032410198.jpg','img/product/md/6378284-10201710251032410198.jpg','img/product/lg/6378284-10201710251032410198.jpg'),
(NULL, 11,'img/product/sm/6378284-7201710251032460200.jpg','img/product/md/6378284-7201710251032460200.jpg','img/product/lg/6378284-7201710251032460200.jpg'),
(NULL, 12,'img/product/sm/6378855-1j201711031614008077.jpg','img/product/md/6378855-1j201711031614008077.jpg','img/product/lg/6378855-1j201711031614008077.jpg'),
(NULL, 12,'img/product/sm/6378855-2201711031614008077.jpg','img/product/md/6378855-2201711031614008077.jpg','img/product/lg/6378855-2201711031614008077.jpg'),
(NULL, 12,'img/product/sm/6378855-5201710251038410241.jpg','img/product/md/6378855-5201710251038410241.jpg','img/product/lg/6378855-5201710251038410241.jpg'),
(NULL, 13,'img/product/sm/57ad359dNdf4a6f10.jpg','img/product/md/6375244.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 13,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6375327.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 13,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6375437.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 14,'img/product/sm/57b12a31Nd8ff75a3.jpg','img/product/md/6375438.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 14,'img/product/sm/57ad359dNdd4a6f10.jpg','img/product/md/6375440.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 15,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6375736.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 15,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6377951.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 16,'img/product/sm/57b12a31N8fff75a3.jpg','img/product/md/6378746.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 16,'img/product/sm/57ad359dNdf4a6f10.jpg','img/product/md/6378807.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 17,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6378863.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 17,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6378864.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 17,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6378863.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 17,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6378864.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 18,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6375656.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 18,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6375687.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 18,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6375688.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 18,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6375709.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 19,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6375710.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 19,'img/product/sm/57b12a31Nd8ff75a3.jpg','img/product/md/6375330.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 19,'img/product/sm/57ad359dNdd4a6f10.jpg','img/product/md/6375333.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 19,'img/product/sm/57b12a31Ndh8f75a3.jpg','img/product/md/6375448.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 20,'img/product/sm/57ad359dNdd4a6f10.jpg','img/product/md/6375449.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 20,'img/product/sm/57b12a31Nd8ff75a3.jpg','img/product/md/6375450.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 20,'img/product/sm/57ad359dNdd4a6f10.jpg','img/product/md/6375451.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 20,'img/product/sm/57ad359dNdd4a6f10.jpg','img/product/md/6375452.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 21,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6375746.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 21,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6375747.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 21,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6375775.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 21,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6376039.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 22,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6376040.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 22,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6376041.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 22,'img/product/sm/57b12a31N8ff75a3.jpg','img/product/md/63452352.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 22,'img/product/sm/57ad359dNd4a6f10.jpg','img/product/md/63757418.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 23,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6139862.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 23,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6139863.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 23,'img/product/sm/57b12a31Nd8ff75a3.jpg','img/product/md/6375704.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 23,'img/product/sm/57ad359dNdd4a6f10.jpg','img/product/md/6375733.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 24,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6373509.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 24,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6373826.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 24,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6375178.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 24,'img/product/sm/57b12a31N8fff75a3.jpg','img/product/md/6375214.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 25,'img/product/sm/57ad359dNdf4a6f10.jpg','img/product/md/6375244.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 25,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6375327.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 25,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6375437.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 25,'img/product/sm/57b12a31Nd8ff75a3.jpg','img/product/md/6375438.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 26,'img/product/sm/57ad359dNdd4a6f10.jpg','img/product/md/6375440.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 26,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6375736.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 26,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6377951.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 26,'img/product/sm/57b12a31N8fff75a3.jpg','img/product/md/6378746.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 27,'img/product/sm/57ad359dNdf4a6f10.jpg','img/product/md/6378807.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 27,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6378863.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 27,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6378864.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 27,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6378863.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 28,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6378864.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 29,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6378863.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 30,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6378864.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 31,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6378863.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 32,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6378864.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 33,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6378864.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 34,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6378863.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 35,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6378864.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 36,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6378863.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 37,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6378864.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 38,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6378864.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 39,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6378863.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 40,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6378864.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 41,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6378863.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 42,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6378864.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 43,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6378864.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 44,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6378863.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 45,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6378864.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 46,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6378863.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 47,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6378864.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 48,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6378864.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 49,'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/6378863.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 50,'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/6378864.jpg','img/product/lg/57ad359dNd4a6f130.jpg');




/**用户信息**/
INSERT INTO v_user VALUES
(NULL, 'lizehua', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'fangfang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1'),
(NULL, 'honghong', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1'),
(NULL, 'meimei', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');

/****首页轮播广告商品****/
INSERT INTO `v_index_carousel` (`cid`, `img`, `title`, `href`) VALUES
(1, 'img/index/banner1.png', '轮播广告商品1', '07-product-detail.html?lid=9'),
(2, 'img/index/banner2.png', '轮播广告商品2', '07-product-detail.html?lid=2'),
(3, 'img/index/banner3.png', '轮播广告商品3', '07-product-detail.html?lid=7'),
(4, 'img/index/banner4.png', '轮播广告商品4', '07-product-detail.html?lid=6'),
(5, 'img/index/banner5.png', '轮播广告商品1', '07-product-detail.html?lid=1'),
(6, 'img/index/banner6.png', '轮播广告商品2', '07-product-detail.html?lid=2');
/****首页商品****/
INSERT INTO `v_index_product` VALUES

(1, '特卖', '0.8折起 BUBUBOSFLFJA 女装特卖', 'img/nav/f1_01.jpg', '5199.00','06-products.html', 1, 1, 1),

(2, '特卖', '0.8折起 BUBUBOSFLFJA 女装特卖', 'img/nav/f1_02.jpg', '5799.00','06-products.html', 2, 2, 2),

(3, '特卖', '0.8折起 BUBUBOSFLFJA 女装特卖', 'img/nav/f1_03.jpg', '5199.00','06-products.html', 3, 3, 3),

(4, '特卖', '0.8折起 BUBUBOSFLFJA 女装特卖', 'img/nav/f1_04.jpg', '5799.00','06-products.html', 4, 4, 4),

(5, '时尚', '0.8折起 BUBUBOSFLFJA 欧美风格', 'img/nav/f2_01.png', '3488.00','06-products.html', 5, 5, 5),

(6, '时尚', '0.8折起 BUBUBOSFLFJA 欧美风格', 'img/nav/f2_02.png', '5399.00','06-products.html', 6, 6, 6),

(7, '时尚', '0.8折起 BUBUBOSFLFJA 欧美风格', 'img/nav/f2_03.png', '4966.00','06-products.html', 7, 7, 7),

(8, '时尚', '0.8折起 BUBUBOSFLFJA 欧美风格', 'img/nav/f2_04.png', '6299.00','06-products.html', 8, 8, 8),

(9, '女装', '0.8折起 BUBUBOSFLFJA 冬季新品', 'img/nav/f3_01.png', '6988.00','06-products.html', 9, 9, 9),

(10, '女装', '0.8折起 BUBUBOSFLFJA 冬季新品', 'img/nav/f3_02.png', '3488.00','06-products.html', 10, 10, 10),

(11, '女装', '0.8折起 BUBUBOSFLFJA 冬季新品', 'img/nav/f3_03.png', '5399.00','06-products.html', 11, 11, 11),

(12, '女装', '0.8折起 BUBUBOSFLFJA 冬季新品', 'img/nav/f3_04.png', '4966.00','06-products.html', 12, 12, 12),

(13, '男装', '0.8折起 BUBUBOSFLFJA 型男必备', 'img/nav/f4_01.png', '6299.00','06-products.html', 13, 13, 13),

(14, '男装', '0.8折起 BUBUBOSFLFJA 型男必备', 'img/nav/f4_02.png', '5199.00','06-products.html', 14, 14, 14),

(15, '男装', '0.8折起 BUBUBOSFLFJA 型男必备', 'img/nav/f4_03.png', '5799.00','06-products.html', 15, 15, 15),

(16, '男装', '0.8折起 BUBUBOSFLFJA 型男必备', 'img/nav/f4_04.png', '6988.00','06-products.html', 16, 16, 16);

