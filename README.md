# airbnb datamart in sql

The primary objective of this endeavor is to create an SQL database that is specifically tailored to the requirements of the Airbnb assignment.

<h3>Requirements</h3>

The database model needs to fulfill certain criteria for successful submission, including:

- The model should have a minimum of 20 entities.
- The model I have created contains 21 entities.
- The model should have 2-3 triple relationships (i.e., join over three tables).
- I have included triple relationships in the address table.
- The model may also include recursive relationships, and all entities should have suitable attributes and marked key attributes.
- I have used the messages-user relationship to demonstrate recursion, where two attributes use the same foreign key with different values.
- All cardinality specifications must be specified using a notation of my choice (e.g., Chen notation).
- I have referenced the cardinality specifications in my Entity Relationship Diagram (ERD).
- A brief description of the current attributes in a data dictionary should be provided.
- I have created a data dictionary using SQL statements and have referenced it in the "data_dictionary_script.sql" document.

<h3>General Idea</h3>

The objective of the conception phase is to create an Entity-Relationship Model (ERM), which will serve as the foundation for the database structure. This process is essential to ensure a well-functioning database. Therefore, a methodology and a deep dive into different entities, attributes, and relationships are necessary.

<h3>Understanding Airbnb</h3>

Airbnb connects guests, hosts, and itself, acting as a middleman between them. Guests are individuals seeking and paying for rentals, while hosts are regular users who display properties to rent. Airbnb itself manages the display of properties, reviews, transactions, and other essential features.

<h3>Guest and Host Actions</h3>

Guests can create accounts, search for properties, and book places for their preferred transaction method. Hosts, on the other hand, manage properties by adding images, amenities, pricing, and service fees.

<h3>Properties</h3>

Properties are the most critical entity in Airbnb, containing information such as areas, availability, pricing, and descriptions. Guests filter from all properties to display the ones that match their preferences.

<h3>Limitations</h3>

A possible limitation of the database model is how guests and hosts are not separated enough. Separating guests and hosts into two different tables may be beneficial for better differentiation.

<h3>ERD</h3>

The ERD was created based on personal experience using Airbnb. Data redundancy and integrity were taken care of by separating values into different components, such as country, state, city, and neighborhood for address data. Geographical locations were added via longitude and latitude. Hosts and guests were combined into one table, differentiated by a BOOLEAN attribute called "is_host."

<h3>Summary</h3>

In summary, creating the SQL database model for Airbnb involved designing an ERM with 20 entities, including triple and recursive relationships. Data redundancy and integrity were ensured through proper data separation and a data dictionary. The limitations of the model were also discussed, and an ERD was created based on personal experience using the Airbnb platform.
