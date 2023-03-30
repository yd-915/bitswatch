CREATE TABLE listings (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    public_id VARCHAR NOT NULL,
    user_id INTEGER NOT NULL,
    title VARCHAR NOT NULL,
    description VARCHAR NOT NULL,
    price_sat INTEGER NOT NULL,
    fee_rate_basis_points INTEGER NOT NULL,
    reviewed INTEGER,
    submitted INTEGER,
    approved INTEGER,
    deactivated_by_seller INTEGER,
    deactivated_by_admin INTEGER,
    created_time_ms INTEGER NOT NULL
);

CREATE TABLE listingimages (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    public_id VARCHAR NOT NULL,
    listing_id INTEGER NOT NULL,
    image_data BLOB NOT NULL,
    is_primary INTEGER NOT NULL
);

CREATE TABLE shippingoptions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    public_id VARCHAR NOT NULL,
    listing_id INTEGER NOT NULL,
    title VARCHAR NOT NULL,
    description VARCHAR NOT NULL,
    price_sat INTEGER NOT NULL
);

CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    public_id VARCHAR NOT NULL,
    buyer_user_id INTEGER NOT NULL,
    seller_user_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    listing_id INTEGER NOT NULL,
    shipping_option_id INTEGER NOT NULL,
    shipping_instructions VARCHAR NOT NULL,
    amount_owed_sat INTEGER NOT NULL,
    seller_credit_sat INTEGER NOT NULL,
    paid INTEGER NOT NULL,
    shipped INTEGER NOT NULL,
    canceled_by_seller INTEGER NOT NULL,
    canceled_by_buyer INTEGER NOT NULL,
    invoice_payment_request VARCHAR NOT NULL,
    invoice_hash VARCHAR NOT NULL,
    review_text VARCHAR NOT NULL,
    review_rating INTEGER NOT NULL,
    reviewed INTEGER NOT NULL,
    created_time_ms INTEGER NOT NULL,
    review_time_ms INTEGER NOT NULL,
    payment_time_ms INTEGER  NOT NULL
);

CREATE TABLE withdrawals (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    public_id VARCHAR NOT NULL,
    user_id INTEGER NOT NULL,
    amount_sat INTEGER NOT NULL,
    created_time_ms INTEGER NOT NULL,
    invoice_hash VARCHAR NOT NULL,
    invoice_payment_request VARCHAR NOT NULL
);

CREATE TABLE useraccounts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    public_id VARCHAR NOT NULL,
    user_id INTEGER NOT NULL,
    amount_owed_sat INTEGER NOT NULL,
    paid INTEGER NOT NULL,
    disabled INTEGER NOT NULL,
    invoice_payment_request VARCHAR NOT NULL,
    invoice_hash VARCHAR NOT NULL,
    created_time_ms INTEGER NOT NULL,
    payment_time_ms INTEGER NOT NULL
);

CREATE TABLE usersettings (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    pgp_key VARCHAR NOT NULL,
    squeaknode_pubkey VARCHAR NOT NULL,
    squeaknode_address VARCHAR NOT NULL
);

CREATE TABLE adminsettings (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    market_name VARCHAR NOT NULL,
    fee_rate_basis_points INTEGER NOT NULL,
    user_bond_price_sat INTEGER NOT NULL,
    pgp_key VARCHAR NOT NULL,
    squeaknode_address VARCHAR NOT NULL,
    squeaknode_pubkey VARCHAR NOT NULL,
    max_allowed_users INTEGER NOT NULL
);
