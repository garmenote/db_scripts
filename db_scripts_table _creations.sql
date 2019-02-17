create table buyers(buyer_id serial NOT NULL , buyer_name varchar(200) NOT NULL,PRIMARY KEY (buyer_id));
CREATE TABLE garments(garments_id serial NOT NULL , garments_name varchar(200) NOT NULL,PRIMARY KEY (garments_id));
CREATE TABLE components_garments(component_id serial NOT NULL UNIQUE , component_name varchar(200) []  ,PRIMARY KEY (component_id,component_name));
CREATE TABLE linenumber(line_id serial NOT NULL , line_name varchar(200) NOT NULL,PRIMARY KEY (line_id));

CREATE TABLE style_details(style_id serial NOT NULL , style_number varchar(200) NOT NULL,order_quantity integer,detail1 varchar(200),detail2 varchar(200),detail3 varchar(200),style_buyer_id integer,style_garment_id integer, 
PRIMARY KEY(style_id),FOREIGN KEY (style_buyer_id) REFERENCES buyers(buyer_id)on delete cascade on update cascade,FOREIGN KEY (style_garment_id) REFERENCES garments(garments_id)on delete cascade on update cascade);

CREATE TABLE buyers_graments(bg_buyer_id integer,bg_garments_id integer,PRIMARY KEY(bg_buyer_id,bg_garments_id),FOREIGN KEY (bg_buyer_id) REFERENCES buyers(buyer_id)on delete cascade on update cascade,
FOREIGN KEY (bg_garments_id) REFERENCES garments(garments_id)on delete cascade on update cascade);

CREATE TABLE styledetails_component(sc_style_id integer,sc_component_id integer,PRIMARY KEY(sc_style_id,sc_component_id),FOREIGN KEY (sc_style_id) REFERENCES style_details(style_id)on delete cascade on update cascade,
FOREIGN KEY (sc_component_id) REFERENCES components_garments(component_id)on delete cascade on update cascade);

CREATE TABLE styledetails_lineNumber(sl_style_id integer,sl_line_id integer,PRIMARY KEY(sl_style_id,sl_line_id),FOREIGN KEY (sl_style_id) REFERENCES style_details(style_id)on delete cascade on update cascade,
FOREIGN KEY (sl_line_id) REFERENCES LineNumber(line_id)on delete cascade on update cascade);

INSERT into buyers ("buyer_name") values ('vans');
INSERT into buyers ("buyer_name") values ('LP');
INSERT into buyers ("buyer_name") values ('Izod');
INSERT into buyers ("buyer_name") values ('PE');
INSERT into buyers ("buyer_name") values ('USPA');


INSERT into garments("garments_name") values ('MShirt');
INSERT into garments("garments_name") values ('WShirt');
INSERT into garments("garments_name") values ('BShirt');
INSERT into garments("garments_name") values ('TShirt');
INSERT into garments("garments_name") values ('ZShirt');



INSERT into components_garments ("component_name") values (ARRAY['Collar',' Neck','cuff']);
INSERT into components_garments ("component_name") values (ARRAY['Collara',' Necka','cuff']);
INSERT into components_garments ("component_name") values (ARRAY['Collarc',' Neck','cuffd']);
INSERT into components_garments ("component_name") values (ARRAY['Collarv',' Neckf','cuff']);
INSERT into components_garments ("component_name") values (ARRAY['Collarn',' Neckn','cuff']);




INSERT into linenumber ("line_name") values ('L1');
INSERT into linenumber ("line_name") values ('L2');
INSERT into linenumber ("line_name") values ('L3');
INSERT into linenumber ("line_name") values ('L4');
INSERT into linenumber ("line_name") values ('L5');

INSERT into style_details ("style_number","order_quantity","detail1","detail2","detail3","style_buyer_id","style_garment_id") values('ABG','100','A','B','C','1','1');
INSERT into style_details ("style_number","order_quantity","detail1","detail2","detail3","style_buyer_id","style_garment_id") values('3HDS','1200','D','E','F','1','1');
INSERT into style_details ("style_number","order_quantity","detail1","detail2","detail3","style_buyer_id","style_garment_id") values('3N5S','21000','I','BH','G','1','1');
INSERT into style_details ("style_number","order_quantity","detail1","detail2","detail3","style_buyer_id","style_garment_id") values('A4SW','8900','AJ','BK','CL','1','1');

INSERT into buyers_graments  values ('1','1');
INSERT into buyers_graments  values ('2','3');
INSERT into buyers_graments  values ('2','4');
INSERT into buyers_graments  values ('3','1');
INSERT into buyers_graments  values ('5','1');

INSERT into styledetails_component  values ('1','1');
INSERT into styledetails_component  values ('2','3');
INSERT into styledetails_component  values ('2','4');

INSERT into styledetails_lineNumber  values ('1','1');
INSERT into styledetails_lineNumber  values ('2','3');
INSERT into styledetails_lineNumber  values ('2','4');

SELECT buyer_name , garments_name ,component_name , style_number ,order_quantity,detail1,detail2,detail3,line_name
FROM style_details  , buyers ,garments ,styledetails_component ,components_garments,styledetails_lineNumber,linenumber
Where  buyer_id = style_buyer_id And garments_id=style_garment_id ANd style_id = sc_style_id AND  component_id = sc_component_id AND style_id = sl_style_id AND line_id=sl_line_id; 

