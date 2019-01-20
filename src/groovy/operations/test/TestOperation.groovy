package operations.test

import com.developmentontheedge.be5.server.operations.support.GOperationSupport
import com.developmentontheedge.be5.operation.Operation
import com.developmentontheedge.be5.operation.OperationResult
import com.developmentontheedge.be5.databasemodel.util.DpsUtils


class TestOperation extends GOperationSupport implements Operation
{
    @Override
    Object getParameters(Map<String, Object> presetValues) throws Exception
    {
        params.add {
            name = "name"
            DISPLAY_NAME = "Имя"
            RELOAD_ON_CHANGE = true
        }

        params.add {
            name = "values"
            TYPE = Integer
            TAG_LIST_ATTR = [1, 2, 3] as Integer[]
            MULTIPLE_SELECTION_LIST = true
            CAN_BE_NULL = true
        }

        params.add("beginDate", "Дата начала") {
            TYPE = java.sql.Date
        }

        return DpsUtils.setValues(params, presetValues)
    }

    @Override
    void invoke(Object parameters) throws Exception
    {
        //validator.setError(params.getProperty("name"), "test error")
        setResult(OperationResult.finished("test message"))
    }
}
