--create table passengers--
create table passengers(
p_id int primary key,
p_name varchar(20)
);
insert into passengers values
(1,'giri'),
(2,'ammu'),
(3,'thulasi'),
(4,'girivani'),
(5,'mamatha'),
(7,'priya'),
(8,'rekha'),
(9,'srelakshmi'),
(10,'ammurutha');

select * from passengers

--create table tickets--
create table tickets(
t_id int,
p_id int ,
source varchar(25),
destination varchar(25),
ticket_date date,
status varchar(20)
);
insert into tickets values
(101,1,'kalakada','hydrabad','2025-11-10','booked'),
(102,2,'hydrabad','chennai','2025-11-10','booked'),
(103,3,'tirupati','benguluru','2025-11-10','cancel'),
(104,4,'tirupati','tirumala','2025-11-11','booked'),
(105,5,'piler','kalakada','2025-11-11','booked'),
(106,6,'benguluru','tirupati','2025-11-10','cancel'),
(107,7,'benguluru','pune','2025-11-09','cancel'),
(108,8,'vizag','tirupati','2025-11-09','booked'),
(109,9,'benguluru','dhelhi','2025-11-09','booked'),
(110,10,'tirupati','pune','2025-11-09','booked'),
(111,11,'chennai','kalakada','2025-11-12','booked');

select * from tickets

---Create table train---
create table train (
t_id int primary key,
train_name varchar(20),
routes varchar(30)
);
insert into train values
(101,'express','kalakada,hydrabad'),
(102,'super luxsalry','benguluru,tirupati'),
(103,'sikindrabad express','tirupati,pune'),
(104,'express','vizag,tirupati'),
(105,'ultra express','benguluru,dhelhi'),
(106,'express','piler,kalakada'),
(107,'palle velugu','tirupati,tirumala');
 insert into train values
 (108,'express','hydrabad,chennai'),
 (109,'ultra','tirupati,pune'),
 (110,'express','tirupati,benguluru');

 select * from train

---Daily ticket report---
 select
 ticket_date,
 count(*)as total_tickets,
 sum(case when  status ='booked' then 1 else 0 end ) as booked_tickets,
 sum( case  when status='cancel' then 1 else 0 end  )as cancel_tickets
 from tickets
 group by ticket_date
 order by ticket_date;
 ---Route-wise passengers------
    select 
        source +'->'+t.destination as route,
        p. p_name as passenger_name,
        t.status
        from tickets t
        join passengers p
        on t.p_id=p.p_id
        order by route,passenger_name;
        
---- Status-wise total (overall booked vs cancel)----
select 
   status,
   count(*) as total_ticket
   from tickets
group by status;
---Most crowded routes---
 select
 ticket_date as date,
  t. source +'->'+ destination as route,
 count(*) as total_passengers
  from tickets t
 group by  t.source , t.destination,t.ticket_date
 order by total_passengers desc;
 
 ---Passenger travel history---
 select 
 p.p_name as passanger_name,
 t.source+'->'+ t.destination as route,
 t.ticket_date,
 t.status
 from passengers p
 join tickets t 
 on p.p_id=t.p_id
 order by  passanger_name,t.ticket_date;
 ---- Daily cancelled ticket report--
  select  
  ticket_date,
  count(*) as total_cancel
  from tickets
  where status='cancel'
  group by ticket_date
  order by ticket_date;
  select 
  ticket_date,
  count(*)as  cancle_tickets
  from tickets
  where status='cancel'
  group by ticket_date
  order by ticket_date;
  --Daily booked tickets report--
   select 
   ticket_date,
   count(*)as booked_tickets
   from tickets
   where status='booked'
   group by ticket_date
   order by ticket_date;
  










        


      



  




