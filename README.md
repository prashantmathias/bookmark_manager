
# bookmark_manager

## User Stories

As a User
So that I can keep track of my bookmarks
I want to see a list of links in chronological order

As a User
So that I can update my bookmarks
I want to add new links

As a User
So that I can manage my bookmarks
I want to add tags to the links

As a User
So that I can easily find my bookmarks
I want to filter the links by tag


## Domain Model


| User        | Message         |
|-------------|-----------------|
| bookmarks   |  see_link       |
| bookmarks   |  add_link       |
| bookmarks   |  add_tags       |
| bookmarks   |  filter         |

bookmarks <-- see_link --> list
bookmarks <-- add_link --> new link
bookmarks <-- add_tags --> new tags
bookmarks <-- filter --> sort tags

CRUD

Create, Read, Update, Destroy

These are the actions for applying to the database to work with the data.

SQL

Structered Query Language

The language that communicates with the database.

Create:   INSERT INTO table_name (column1,column2,column3,...)
          VALUES (value1,value2,value3,...);

Read:     SELECT * FROM table_name;
          SELECT CustomerName,City FROM Customers;

Update:   UPDATE table_name
          SET column1=value1,column2=value2,...
          WHERE some_column=some_value;

Destroy:  DELETE FROM table_name
          WHERE some_column=some_value;
