ALTER TABLE "Calendar-copy" ADD PRIMARY KEY (listing_id,date);
ALTER TABLE "Listings-Summary-copy" ADD PRIMARY KEY (id);
ALTER TABLE "Reviews-copy" ADD PRIMARY KEY (id);
ALTER TABLE "Geolocation-copy" ADD PRIMARY KEY (properties_neighbourhood);
ALTER TABLE "Listings-copy" ADD PRIMARY KEY (id);
ALTER TABLE "Neighbourhoods-copy" ADD PRIMARY KEY (neighbourhood);



ALTER TABLE "Calendar-copy" ADD FOREIGN KEY (listing_id) REFERENCES "Listings-copy"(id);
ALTER TABLE "Listings-Summary-copy" ADD FOREIGN KEY (id) REFERENCES "Listings-copy"(id);
ALTER TABLE "Reviews-copy" ADD FOREIGN KEY (listing_id) REFERENCES "Listings-copy"(id);
ALTER TABLE "Reviews-Summary-copy" ADD FOREIGN KEY (listing_id) REFERENCES "Listings-copy"(id);
ALTER TABLE "Listings-Summary-copy" ADD FOREIGN KEY (neighbourhood) REFERENCES "Neighbourhoods-copy"(neighbourhood);
ALTER TABLE "Geolocation-copy" ADD FOREIGN KEY (properties_neighbourhood) REFERENCES "Neighbourhoods-copy"(neighbourhood);
ALTER TABLE "Listings-copy" ADD FOREIGN KEY (neighbourhood_cleansed) REFERENCES "Neighbourhoods-copy"(neighbourhood);