USE AP;

BEGIN TRAN;
  UPDATE Invoices
  SET VendorID = 123
  WHERE VendorID = 122;

  DELETE Vendors
  WHERE VendorID = 122;

  UPDATE Vendors
  SET VendorName = 'FedUP'
  WHERE VendorID = 123;
COMMIT TRAN;
