use rocket_db_pools::{sqlx, Database};

#[derive(Database)]
#[database("railway")]
pub struct Db(pub sqlx::SqlitePool);
