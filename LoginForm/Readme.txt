----------------------------------------

  
CREATE proc sp_reg (@id varchar(50), @password varchar(50), @email varchar(50), @phone varchar(50), @name varchar(50))  
as  
begin  
insert into user_registration values (@id,@password,@email,@phone,@name)  
select * from user_registration  
end

-------------------------------------------------

CREATE TABLE [dbo].[user_registration](
	[id] [varchar](200) NULL,
	[password] [varchar](200) NULL,
	[email] [varchar](200) NULL,
	[phone] [varchar](200) NULL,
	[name] [varchar](200) NULL
) ON [PRIMARY]

----------------------------------
  
  
CREATE proc spmenu(@id varchar(20), @pass varchar(20))      
as      
begin      
  
if not exists(select 1 from loginmenu where id = @id)  
begin   
 insert into loginmenu values (@id,@pass)    
end  
    
select * from loginmenu    
end
-----------------------------

CREATE TABLE [dbo].[loginmenu](
	[id] [varchar](20) NULL,
	[password] [varchar](20) NULL
) ON [PRIMARY]