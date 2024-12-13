CREATE FUNCTION listings_count_change()
RETURNS TRIGGER AS 
$$
BEGIN
IF TG_OP = 'DELETE' THEN
    UPDATE "Host-copy"
    SET listings_count = listings_count - 1
    WHERE OLD.host_id = "Host-copy".id;
    RETURN OLD;
ELSIF TG_OP = 'INSERT' THEN
    UPDATE "Host-copy"
    SET listings_count = listings_count + 1
    WHERE NEW.host_id = "Host-copy".id;
    RETURN NEW;
END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER listings_count_change_trigger
AFTER INSERT OR DELETE
ON "Listing-copy"
FOR EACH ROW
EXECUTE PROCEDURE listings_count_change();

CREATE FUNCTION review_count_change()
RETURNS TRIGGER AS
$$
BEGIN
IF TG_OP = 'DELETE' THEN
    UPDATE "Listing-copy"
    SET number_of_reviews = number_of_reviews - 1
    WHERE OLD.listing_id = "Listing-copy".id;
    RETURN OLD;
ELSIF TG_OP = 'INSERT' THEN
    UPDATE "Listing-copy"
    SET number_of_reviews = number_of_reviews + 1
    WHERE NEW.listing_id = "Listing-copy".id;
    RETURN NEW;
END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER review_count_trigger
AFTER INSERT OR DELETE
ON "Review-copy"
FOR EACH ROW
EXECUTE PROCEDURE review_count_change();
