use medicament_db;
insert user_type(user_type_name) values ('admin');
select * from region where region_name like '闸北%';
insert user_address(region_province_id,region_city_id,region_country_id,user_address) values(321,321,3,'上海大学(延长校区)');
insert user(user_type_id,username,password,email,user_address_id) values(1,'yonie','2333','yong_cyril@163.com',1);
select * from user;
update user set create_time = current_timestamp() where user_id = 1;

select * from user_address where user_address_id = 1;

select * from region where region_name like '%上海%';

select * from region where region_parent_id = 321;

insert manufacturer_address values(1,2,52,500,'五环');

insert manufacturer values(1,'北京赛升药业','',1);

insert repository_address values(1,25,321,2704,'延长路149号');


insert repository values(1,'上海大药房仓库',1,'聂勇','18621721545');

insert product values(1,'阿莫西林',null,null,1,1000,1,10,null);

insert product values(2,'后悔药',null,null,1,1000,1,10000,null);


insert client_address values(1,2,52,500,'六环');
insert client values(1,'上海棒棒药店',null,null,'私人','小李','+8618812346780',1);

insert `order` (client_id,order_status) values(1,0);

insert order_detail values(1,1,1,10,100);
insert order_detail values(2,1,2,10,100);

select * from order_detail;

select order_id,sum(product_num) as total from order_detail group by order_id;

insert `order` (client_id,order_status) values(1,0);

insert order_detail values(7,2,8,10,100);
insert order_detail values(8,2,1,10,100);

select * from `order`;

select * from order_detail;
select * from product;

select * from order_detail;

insert order_detail(order_id,product_id,product_num,order_detail_total_money) values(4,3,1,9999);

select * from purchase;

insert dispatch(repository_from_id,repository_to_id) values(1,2);
select * from dispatch;

delete from dispatch where dispatch_id = 1;


