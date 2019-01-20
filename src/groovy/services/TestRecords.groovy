package services

import com.developmentontheedge.be5.database.DbService
import com.developmentontheedge.be5.query.model.beans.QRec
import com.developmentontheedge.be5.query.sql.QRecParser

import javax.inject.Inject

class TestRecords
{
    @Inject private DbService db

    List<QRec> recsForUser(String userName)
    {
        return db.list("""
            SELECT t.* 
            FROM testtable t
            INNER JOIN users u ON t.name = u.user_name
            WHERE u.user_name = ?
        """, new QRecParser(), userName)
    }

    String findNameById(int id)
    {
        return db.oneString("SELECT name FROM testtable WHERE id = ?", id)
    }

    QRec findById(int id)
    {
        return db.select("SELECT * FROM testtable WHERE id = ?", new QRecParser(), id)
    }
}
