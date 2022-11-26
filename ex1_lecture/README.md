#  ERD model of crop pest database

## Atribute and table overview

#### 1) farmer (farmer data table):
- id_farmer (primary key)
- name (farmer's name)
- amou_crop (number of farms owned by the farmer)

#### 2) culuvation (table):
- owner (owner's name)
- climate
- area
- type (kind of plants)
- crop_id (primary key)

#### 3) location (table):
- lon (longitude)
- lat (latitude)
- n_city (nearest city)
- n_market (nearest market) ! in one ! 
 
#### 4) pest (table):
- name(pest's name)
- pest_id (primary key)
- crop_type(Multivalued Attribute(refere to type in culuvation))
- climate

#### 5) anti_pest_product (table):
- name (product's name)
- prices
- manufacturer
- crop_type (Multivalued Attribute(refere to type in culuvation)
- chemicals (Multivalued Attribute)
- pest_type (type of pest)

#### 6) company (table):
- name (company name)
- com_id (company id)

#### 7) market (table):
- name (market name)

