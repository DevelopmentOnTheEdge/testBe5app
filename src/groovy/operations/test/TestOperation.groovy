package test

import com.developmentontheedge.be5.operations.support.GOperationSupport
import com.developmentontheedge.be5.operation.Operation
import com.developmentontheedge.be5.operation.OperationResult
import com.developmentontheedge.be5.util.DpsUtils


class TestOperation extends GOperationSupport implements Operation
{

    @Override
    Object getParameters(Map<String, Object> presetValues) throws Exception
    {
        dps.add {
            name = "name"
            DISPLAY_NAME = "Имя"
        }

        dps.add("beginDate", "Дата начала") {
            TYPE = java.sql.Date
        }

        return DpsUtils.setValues(dps, presetValues)
    }

    @Override
    void invoke(Object parameters) throws Exception
    {
        //validator.setError(dps.getProperty("name"), "test error")
        setResult(OperationResult.finished("test message"))
    }

}
