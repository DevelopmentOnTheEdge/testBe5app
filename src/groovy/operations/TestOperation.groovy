import com.developmentontheedge.be5.operation.Operation
import com.developmentontheedge.be5.operation.OperationContext
import com.developmentontheedge.be5.operation.OperationSupport



class TestOperation extends OperationSupport implements Operation
{

    @Override
    Object getParameters(Map<String, String> presetValues) throws Exception
    {
        dps << [name: "name", DISPLAY_NAME: "Имя"]

        dps << [
                name        : "beginDate",
                DISPLAY_NAME: "Дата начала",
                TYPE        : java.sql.Date
        ]

        dps << [
                name         : "reason",
                DISPLAY_NAME : "Причина снятия предыдущего работника",
                TAG_LIST_ATTR: [["fired", "Уволен"], ["vacation", "Отпуск"], ["sick", "На больничном"], ["other", "Иная причина"]] as String[][]
        ]

        dps << [
                name                   : "reasonMulti",
                DISPLAY_NAME           : "Множественный выбор",
                MULTIPLE_SELECTION_LIST: true,
                TAG_LIST_ATTR          : [["fired", "Уволен"], ["vacation", "Отпуск"], ["sick", "На больничном"], ["other", "Иная причина"]] as String[][]
        ]

        return dps
    }

    @Override
    void invoke(Object parameters, OperationContext context) throws Exception
    {
        //String sql = generateSql( connector, false );
        //db.insert(sql);
    }

}
