CREATE TABLE InputTbl (
    col1 VARCHAR(10),
    col2 VARCHAR(10)
);
    INSERT INTO InputTbl (col1, col2) VALUES 
('a', 'b'),
('a', 'b'),
('b', 'a'),
('c', 'd'),
('c', 'd'),
('m', 'n'),
('n', 'm');

select min(col1) as col1, max(col2) as col2
from InputTbl
group by 
    case 
        when col1 < col2 then col1 + '-' + col2
        else col2 + '-' + col1
    end

select 
    case when col1 < col2 then col1 else col2 end as col1,
    case when col1 < col2 then col2 else col1 end as col2
from InputTbl
group by 
    case when col1 < col2 then col1 else col2 end,
    case when col1 < col2 then col2 else col1 end


-----------------------------------------------------------------------------------------


CREATE TABLE TestMultipleZero (
    A INT NULL,
    B INT NULL,
    C INT NULL,
    D INT NULL
);

INSERT INTO TestMultipleZero(A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);


	select*from TestMultipleZero
	where not (A=0 and B=0 and C=0 and D=0)


-----------------------------------------------------------------------------

create table section1(id int, name varchar(20))
insert into section1 values (1, 'Been'),
       (2, 'Roma'),
       (3, 'Steven'),
       (4, 'Paulo'),
       (5, 'Genryh'),
       (6, 'Bruno'),
       (7, 'Fred'),
       (8, 'Andro')

	select*from section1
	where id % 2=1


-----------------------------------------------------------------------------

select*from section1
where id =(select min (id) from section1)

----------------------------------------------------------------

select*from section1
where id =(select max (id) from section1)

----------------------------------------------------------------------

select*from section1
where name like 'B%'

-------------------------------------------------------------------

CREATE TABLE ProductCodes (
    Code VARCHAR(20)
);

INSERT INTO ProductCodes (Code) VALUES
('X-123'),
('X_456'),
('X#789'),
('X-001'),
('X%202'),
('X_ABC'),
('X#DEF'),
('X-999');


select * from ProductCodes
where Code like '%/_%' escape '/'


