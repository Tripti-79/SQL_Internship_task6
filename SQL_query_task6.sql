select passenger_id,passenger_name,email,contact from passenger where PASSENGER_ID in(select passenger_id from ticket where booking_date=to_date('14/04/2025','DD-MM-YYYY')) ; 

select t.train_name,s.station_name,to_char(r.arrival,'HH:MI AM')Arrival,to_char(r.depart,'HH:MI AM')Depart from train t ,station s ,route r where t.train_id=r.train_id and s.STATION_ID=r.STATION_ID and r.train_id=(select train_id from train where train_id='tr4') order by r.arrival,r.depart ;

select * from PASSENGER ps where EXISTS(select PASSENGER_ID from PAYMENT py where py.PASSENGER_ID=ps.PASSENGER_ID and py.pay_mode='UPI')  ;

select t1.TRAIN_name,t1.SOURCE_STATION,t1.DESTINATION_STATION,t1.station_name route from (select t.train_id,t.SOURCE_STATION,t.DESTINATION_STATION,t.TRAIN_name,s.station_name,r.ARRIVAL,r.depart from route r,train t,station s where t.TRAIN_ID=r.TRAIN_ID and r.STATION_ID=s.STATION_ID )t1 where t1.SOURCE_STATION!=t1.station_name and t1.DESTINATION_STATION!=t1.station_name  order by t1.TRAIN_ID ;

select a.passenger_id,a.passenger_name,a.contact,b.total_amount from passenger a,(select passenger_id,sum(amount)total_amount from payment group by passenger_id )b where a.PASSENGER_ID=b.passenger_id order by a.passenger_id;

