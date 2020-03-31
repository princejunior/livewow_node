DROP TABLE client_order_content_items;
DROP TABLE client_order;
DROP TABLE content_items;
DROP TABLE content;
DROP TABLE client_description;
DROP TABLE trainer_description;
DROP TABLE trainer_client;
DROP TABLE trainer;
DROP TABLE client;
DROP TABLE customer;

-- customer -- 
CREATE TABLE customer
( id                 SERIAL       NOT NULL PRIMARY KEY
, email              VARCHAR(50)  NOT NULL UNIQUE
, password           VARCHAR(50)  NOT NULL
, customer_type      VARCHAR(10) NOT NULL
);

-- trainer -- 
CREATE TABLE trainer
( id                SERIAL       NOT NULL PRIMARY KEY
, customer_id       INT          NOT NULL REFERENCES customer(id)
, first_name        VARCHAR(100) NOT NULL
, last_name         VARCHAR(100) NOT NULL
, profile_img_url   VARCHAR(200) 
, speciality        VARCHAR(50)  NOT NULL 
);

-- client -- 
CREATE TABLE client
( id                SERIAL       NOT NULL PRIMARY KEY
, customer_id       INT          NOT NULL REFERENCES customer(id)
, first_name        VARCHAR(100) NOT NULL
, last_name         VARCHAR(100) NOT NULL
, profile_img_url   VARCHAR(200) 

);
-- Trainer's Description--
Create TABLE trainer_description
(      
        trainer_id   INT           NOT NULL REFERENCES trainer(id)
       , about_me    VARCHAR(1000)  NOT NULL
       , my_mission  VARCHAR(500)  NOT NULL
       , my_vision   VARCHAR(500)  NOT NULL         
);

Create TABLE client_description
(      
        client_id    INT           NOT NULL REFERENCES trainer(id)
       , about_me    VARCHAR(1000) NOT NULL
       , my_goals    VARCHAR(500)  NOT NULL
       , my_vision   VARCHAR(500)  NOT NULL         
);

-- content --
CREATE TABLE content 
( id                 SERIAL NOT NULL PRIMARY KEY
, trainer_id         INT    NOT NULL REFERENCES trainer(id)
, post_img_url       VARCHAR(200) NOT NULL
, post_description   VARCHAR(200) NOT NULL
, post_price         FLOAT        NOT NULL
, difficulty         VARCHAR(50)  NOT NULL
, title              VARCHAR(50)  NOT NULL  
);

-- trainer_client --
CREATE TABLE trainer_client 
( trainer_id    INT NOT NULL REFERENCES trainer(id)
, client_id     INT NOT NULL REFERENCES client(id)
);

-- order --
CREATE TABLE client_order
( id           SERIAL NOT NULL PRIMARY KEY
, client_id    INT    NOT NULL REFERENCES client(id)
);

-- content_items --
CREATE TABLE content_items
( id           SERIAL NOT NULL PRIMARY KEY
, trainer_id   INT    NOT NULL REFERENCES trainer(id)
, content_id   INT    NOT NULL REFERENCES content(id)
);

-- order_content_items --
CREATE TABLE client_order_content_items
( client_order_id     INT NOT NULL REFERENCES client_order(id)
, content_item_id     INT NOT NULL REFERENCES content_items(id)
);

-- ----------------------------------------------- --
-- -------- POPULATE THE  MENU_ITEM TABLE -------- --
-- ----------------------------------------------- --  
INSERT INTO customer (email
                         , password
                         , customer_type) 
                  VALUES ( '1@gmail.com'
                         , '1234567'
                         , 'trainer');  
INSERT INTO customer (email
                         , password
                         , customer_type) 
                  VALUES ( '2@gmail.com'
                         , '1234567'
                         , 'trainer');  
INSERT INTO customer (email
                         , password
                         , customer_type) 
                  VALUES ( '3@gmail.com'
                         , '1234567'
                         , 'trainer');  
INSERT INTO customer (email
                         , password
                         , customer_type) 
                  VALUES ( '4@gmail.com'
                         , '1234567'
                         , 'client');  
INSERT INTO customer (email
                         , password
                         , customer_type) 
                  VALUES ( '5@gmail.com'
                         , '1234567'
                         , 'client');  
INSERT INTO customer (email
                         , password
                         , customer_type) 
                  VALUES ( '6@gmail.com'
                         , '1234567'
                         , 'client');  
INSERT INTO customer (email
                         , password
                         , customer_type) 
                  VALUES ( '7@gmail.com'
                         , '1234567'
                         , 'trainer');  
INSERT INTO customer (email
                         , password
                         , customer_type) 
                  VALUES ( '8@gmail.com'
                         , '1234567'
                         , 'trainer');  
INSERT INTO customer (email
                         , password
                         , customer_type) 
                  VALUES ( '9@gmail.com'
                         , '1234567'
                         , 'trainer');  
INSERT INTO customer (email
                         , password
                         , customer_type) 
                  VALUES ( '10@gmail.com'
                         , '1234567'
                         , 'trainer');  
INSERT INTO customer (email
                         , password
                         , customer_type) 
                  VALUES ( '11@gmail.com'
                         , '1234567'
                         , 'trainer');  
INSERT INTO customer (email
                         , password
                         , customer_type) 
                  VALUES ( '12@gmail.com'
                         , '1234567'
                         , 'trainer');  
-- ----------------------------------------------- --
-- --------- POPULATE THE TRAINER TABLE --------- --
-- ----------------------------------------------- --
INSERT INTO trainer ( customer_id
                        , first_name
                        , last_name
                        , profile_img_url
                        ,speciality) 
                 VALUES (1 
                        ,'Jessica' 
                        ,'Gunn'
                        , 'https://polar-waters-71288.herokuapp.com/week05/assignment/trainerProfilePicture/jessica_Gunn_hori.jpeg'
                        , 'Core Strengthening and HIIT')
                        ;
INSERT INTO trainer ( customer_id
                        , first_name
                        , last_name
                        , profile_img_url
                        ,speciality) 
                 VALUES (2
                        ,'Paige'
                        , 'Bartlett'
                        , 'https://polar-waters-71288.herokuapp.com/week05/assignment/trainerProfilePicture/paige_bartlett_2_horiz.jpg'
                        ,'HyperTrophy'
                        );
INSERT INTO trainer ( customer_id
                        , first_name
                        , last_name
                        , profile_img_url
                        ,speciality) 
                 VALUES (3
                        ,'Spencer'
                        , 'Serranilla'
                        , 'https://polar-waters-71288.herokuapp.com/week03/assignment/photos_LW/lwrussiantwist.jpg'
                        ,'Cardio'
                        );
INSERT INTO trainer ( customer_id
                        , first_name
                        , last_name
                        , profile_img_url
                        ,speciality) 
                 VALUES (7 
                        ,'Elijah'
                        ,'Elliott'
                        , 'https://polar-waters-71288.herokuapp.com/week03/assignment/photos_LW/lwPose.jpg'
                        , 'Power Lifter'
                        );

INSERT INTO trainer ( customer_id
                        , first_name
                        , last_name
                        , profile_img_url
                        ,speciality)
                 VALUES (8 
                        ,'Elon'
                        , 'Musk'
                        , 'https://polar-waters-71288.herokuapp.com/week03/assignment/photos_LW/lwrussiantwist.jpg'
                        , 'Power Lifter');
INSERT INTO trainer ( customer_id
                        , first_name
                        , last_name
                        , profile_img_url
                        ,speciality)
                 VALUES (9 
                        ,'Bill'
                        ,'Gates'
                        , 'https://polar-waters-71288.herokuapp.com/week03/assignment/photos_LW/lwrussiantwist.jpg'
                        , 'Crossfit');
INSERT INTO trainer ( customer_id
                        , first_name
                        , last_name
                        , profile_img_url
                        ,speciality)
                 VALUES (10
                        ,'Pete' 
                        ,'the Pilot'
                        , 'https://polar-waters-71288.herokuapp.com/week03/assignment/photos_LW/lwrussiantwist.jpg'
                        , 'Hypertrophey'
                        );
INSERT INTO trainer ( customer_id
                        , first_name
                        , last_name
                        , profile_img_url
                        ,speciality) 
                 VALUES (11 
                        ,'Jeff' 
                        ,'Bezos'
                        , 'https://polar-waters-71288.herokuapp.com/week03/assignment/photos_LW/lwrussiantwist.jpg'
                        , 'Pilates')
                        ;
INSERT INTO trainer ( customer_id
                        , first_name
                        , last_name
                        , profile_img_url
                        ,speciality)
                 VALUES (12 
                        ,'Meghan'
                        , 'Hutson'
                        , 'https://polar-waters-71288.herokuapp.com/week03/assignment/photos_LW/lwrussiantwist.jpg'
                        , 'Yoga');

-- ----------------------------------------------- --
-- -------- POPULATE THE RESTAURANT TABLE -------- --
-- ----------------------------------------------- -- 
INSERT INTO client (customer_id
                        , first_name
                        , last_name
                        , profile_img_url) 
                 VALUES (1 
                        ,'Jessica' 
                        ,'Gunn'
                        , 'https://polar-waters-71288.herokuapp.com/week05/assignment/trainerProfilePicture/jessica_Gunn_client.jpeg'
                        )
                        ;
INSERT INTO client ( customer_id
                        ,first_name
                        ,last_name
                        , profile_img_url) 
                   VALUES (4
                          ,'Rick'
                          ,'askfhj'
                          , 'nkn'
                          );  
INSERT INTO client ( customer_id
                        ,first_name
                        ,last_name
                        , profile_img_url) 
                   VALUES (5
                          ,'Morty'
                          ,'hkjfdhka'
                          , 'nnn'
                          ); 
INSERT INTO client ( customer_id
                        ,first_name
                        ,last_name
                        , profile_img_url) 
                   VALUES (6
                          ,'Bob'
                          , 'fsdjfkj'
                          , 'jnkjn'
                          );  
INSERT INTO client ( customer_id
                        ,first_name
                        ,last_name
                        , profile_img_url) 
                   VALUES (2
                          ,'Paige'
                          , 'Bartlett'
                          , 'https://polar-waters-71288.herokuapp.com/week05/assignment/trainerProfilePicture/paige_bartlett_3.jpeg'
                          );  

-- ----------------------------------------------- --
-- ---------- POPULATE THE  Content ---------- --
-- ----------------------------------------------- -- 
INSERT INTO trainer_description(
         trainer_id   
       , about_me   
       , my_mission  
       , my_vision)
       VALUES (1
       , 'I am Jessica Gunn - wife, mother and personal trainer. A few years after having my four children I decided it was finally time to invest in myself by starting an exercise program and making better food choices. 
       I was tired of feeling irritable and exhausted and knew it was time to make some changes. I have never been someone that values exercising and eating healthy and it was very difficult finding what worked for my body. 
       After a few months I finally started seeing physical and mental changes. I was such a better wife and mother that I decided to get certified as a personal fitness trainer so that I could help other men and women gain 
       confidence and strength as I help them with their fitness and nutrition goals. After a year of training I opened my own business and now train clients and teach group hiit classes. I specialize in core strengthening 
       and hiit training. It’s the most rewarding job watching people realize they can do hard things. '
       , 'I want to help you gain confidence and strength as we work together achieving your fitness and nutrition goals.'
       , 'By the end of one of my programs, you will be a new person.' );
INSERT INTO trainer_description(
         trainer_id   
       , about_me   
       , my_mission  
       , my_vision)
       VALUES (2
       , 'My name is Paige Bartlett! My fitness journey began back in high school when I developed an eating disorder due to severe body dysmorphia and lack of confidence in my body. I have a Bachelors of science in Public Health, a NASM cpt, and am currently working on a nutrition certification. Remember, I am on your team and will always be your biggest fan in your positive transformation!'
       , 'I empower women with confidence in the best version of themselves through weightlifting'
       , 'Helping you find your sweet spot in imperfect perfection; pushing yourself past what you thought was possible but embracing yourself when you need grace on the rough days.'
       );
-- ----------------------------------------------- --
-- ---------- POPULATE THE  Content ---------- --
-- ----------------------------------------------- -- 
INSERT INTO content ( trainer_id  
                     , post_img_url       
                     , post_description   
                     , post_price
                     , difficulty
                     , title 
                     ) 
                  VALUES (1
                     , 'https://polar-waters-71288.herokuapp.com/week05/assignment/trainerProfilePicture/jessica_Gunn_Vert.jpeg'
                     , 'Only have a barbell and weighted plates then this is the workout for you!' 
                         , 20.00
                         , 'Beginner'
                         , '3 Month HIIT Workout'); 
INSERT INTO content (trainer_id  
                     , post_img_url       
                     , post_description   
                     , post_price
                     , difficulty 
                     , title  
                     ) 
                  VALUES (1
                     , 'https://polar-waters-71288.herokuapp.com/week05/assignment/trainerProfilePicture/jessica_Gunn_Vert.jpeg'                        
                         , 'You need this program since it only requires you! This program will help stregthen your core with out weights.'
                         , 20.00
                         , 'Beginner'
                         , '3 Month Abs Workout');   
INSERT INTO content (trainer_id  
                     , post_img_url       
                     , post_description   
                     , post_price
                     , difficulty 
                     , title  
                     ) 
                  VALUES (1
                     , 'https://polar-waters-71288.herokuapp.com/week05/assignment/trainerProfilePicture/jessica_Gunn_Vert.jpeg'                         
                         , 'gjhgjhgjhgj'
                         , 20.00
                         , 'Beginner'
                         , '3 Month Hypertrophey Workout');  
INSERT INTO content (trainer_id  
                     , post_img_url       
                     , post_description   
                     , post_price
                     , difficulty 
                     , title  
                     ) 
                  VALUES (1
                     , 'https://polar-waters-71288.herokuapp.com/week05/assignment/trainerProfilePicture/jessica_Gunn_Vert.jpeg'                         
                         , 'gjhgjhgjhgj'
                         , 20.00
                         , 'Beginner'
                         , '3 Month Power Lifting Workout');  
INSERT INTO content (trainer_id  
                     , post_img_url       
                     , post_description   
                     , post_price
                     , difficulty 
                     , title  
                     ) 
                  VALUES (1
                     , 'https://polar-waters-71288.herokuapp.com/week05/assignment/trainerProfilePicture/jessica_Gunn_Vert.jpeg'                        
                         , 'gjhgjhgjhgj'
                         , 20.00
                         , 'Beginner'
                         , '3 Month Yoga Workout');  
INSERT INTO content ( trainer_id  
                     , post_img_url       
                     , post_description   
                     , post_price
                     , difficulty
                     , title 
                     ) 
                  VALUES (2
                         , 'https://polar-waters-71288.herokuapp.com/week05/assignment/trainerProfilePicture/paige_bartlett_2.jpg'
                         , 'Program-8 week hypertrophy'
                         , 50.00
                         , 'Beginner'
                         , 'Program-8 week Hypertrophy');  
INSERT INTO content (trainer_id  
                     , post_img_url       
                     , post_description   
                     , post_price
                     , difficulty 
                     , title  
                     ) 
                  VALUES (2
                          , 'https://polar-waters-71288.herokuapp.com/week05/assignment/trainerProfilePicture/paige_bartlett_2.jpg'
                         , 'Program-12 week fullbody dumbbell workouts '
                         , 50.00
                         , 'Beginner'
                         , 'Program-12 week fullbody dumbbell workouts ');  
INSERT INTO content (trainer_id  
                     , post_img_url       
                     , post_description   
                     , post_price
                     , difficulty 
                     , title  
                     ) 
                  VALUES (2
                          , 'https://polar-waters-71288.herokuapp.com/week05/assignment/trainerProfilePicture/paige_bartlett_3.jpeg'                         
                         , 'Program-12 week strength/power'
                         , 20.00
                         , 'Beginner'
                         , 'Program-12 week strength/power');  
INSERT INTO content (trainer_id  
                     , post_img_url       
                     , post_description   
                     , post_price
                     , difficulty 
                     , title  
                     ) 
                  VALUES (2
                          , 'https://polar-waters-71288.herokuapp.com/week05/assignment/trainerProfilePicture/paige_bartlett_4.jpeg'                         
                         , '30 min'
                         , 25.00
                         , 'Beginner'
                         , '30 min');  
INSERT INTO content (trainer_id  
                     , post_img_url       
                     , post_description   
                     , post_price
                     , difficulty 
                     , title  
                     ) 
                  VALUES (2
                          , 'https://polar-waters-71288.herokuapp.com/week05/assignment/trainerProfilePicture/paige_bartlett.jpg'                         
                         , '60 min'
                         , 45.00
                         , 'Beginner'
                         , '60 min');  
INSERT INTO content (trainer_id  
                     , post_img_url       
                     , post_description   
                     , post_price
                     , difficulty 
                     , title  
                     ) 
                  VALUES (2
                          , 'https://polar-waters-71288.herokuapp.com/week05/assignment/trainerProfilePicture/paige_bartlett_3.jpeg'                         
                         , 'gjhgjhgjhgj'
                         , 20.00
                         , 'Beginner'
                         , '3 Month Cardio Workout');  

-- ----------------------------------------------- --
-- ----- POPULATE THE client_order TABLE ----- --
-- ----------------------------------------------- --
INSERT INTO content_items (id
                                , trainer_id
                                , content_id) 
                         VALUES ( 1
                                , 1
                                , 1);

-- ----------------------------------------------- --
-- ----- POPULATE THE client_order TABLE ----- --
-- ----------------------------------------------- --  
INSERT INTO client_order (id
                                , client_id) 
                         VALUES ( 1
                                , 1);
INSERT INTO client_order (id
                                , client_id) 
                         VALUES ( 2
                                , 2);
INSERT INTO client_order (id
                                , client_id) 
                         VALUES ( 3
                                , 3);  
                                  

-- ----------------------------------------------- --
-- ----- POPULATE THE content_items TABLE ----- --
-- ----------------------------------------------- --    
INSERT INTO client_order_content_items (client_order_id
                                , content_item_id) 
                         VALUES ( 1
                                , 1);    
-- \echo '*********************List all customer info*********************'
-- SELECT * FROM customer;
-- \echo '*********************List all trainer names*********************'
-- SELECT first_name, last_name FROM trainer;
-- \echo '****************List trainer names name, id, customer_id, profile_img_url****************'
-- SELECT * FROM trainer;
-- \echo '************************List  all clients************************'
-- SELECT * FROM client;
-- \echo '************************List  all trainer_description************************'
-- SELECT * FROM trainer_description;
-- \echo '************************List  all clients orders************************'
-- SELECT * FROM client_order;
-- \echo '************************List  all trainers items************************'
-- SELECT * FROM content_items;
-- \echo '************************List  all clients orders of trainer items************************'
-- SELECT * FROM client_order_content_items;
-- \echo '************************view customer info of trainer************************'
-- SELECT c.id     AS "Customer ID"
--      , email      AS "eamil"
--      , password     AS "Password"
--      , customer_type AS "Type"
--      , t.first_name           AS "Trainer's First Name"
--      , t.last_name           AS "Trainer's Last Name"
--      , t.profile_img_url AS "Picture URL"
--    FROM       customer      c 
--    right JOIN trainer        t ON c.id  = t.customer_id;
-- \echo '************************view customer info of clients************************'
--    SELECT c.id     AS "Customer ID"
--      , email      AS "eamil"
--      , password     AS "Password"
--      , customer_type AS "Type"
--      , cl.first_name      AS "Client's First Name"
--      , cl.last_name      AS "Client's Last Name"
--      , cl.profile_img_url AS "Picture URL"
--    FROM       customer      c 
--    right JOIN client        cl ON c.id  = cl.customer_id;   
-- \echo '************************view customer info of trainers************************'
--    SELECT co.id     AS "Content ID"
--      , post_img_url  AS "post_img_url"
--      , post_description      AS "Description"
--      , post_price     AS "Price"
--      , t.first_name      AS "Trainer's First Name"     
--      , t.last_name      AS "Trainer's Last Name"     
--    FROM       content      co 
--    LEFT JOIN trainer        t ON co.trainer_id  = t.id;  
    
