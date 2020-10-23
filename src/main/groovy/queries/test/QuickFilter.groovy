package queries.test

import com.developmentontheedge.be5.query.model.beans.QRec
import com.developmentontheedge.be5.server.queries.support.QueryExecutorSupport

class QuickFilter extends QueryExecutorSupport
{
    @Override
    List<QRec> execute()
    {
        addColumns("value","name")
        addRow(cells(cell("yes"),cell("yes")));
        addRow(cells(cell("no"),cell("no")));
        return table();
    }
}
