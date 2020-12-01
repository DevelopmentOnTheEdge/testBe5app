package operations.test

import com.developmentontheedge.be5.databasemodel.util.DpsUtils
import com.developmentontheedge.be5.operation.Operation
import com.developmentontheedge.be5.operation.OperationResult
import com.developmentontheedge.be5.server.operations.support.GOperationSupport
import groovy.transform.TypeChecked

@TypeChecked
class TestLongTimeOperation extends GOperationSupport implements Operation
{
    @Override
    Object getParameters(Map<String, Object> presetValues) throws Exception
    {
        params.add {
            name = "name"
            DISPLAY_NAME = "Имя"
            RELOAD_ON_CHANGE = true
            CAN_BE_NULL = true
        }
        return DpsUtils.setValues(params, presetValues)
    }

    @Override
    void invoke(Object parameters) throws Exception
    {
        Thread.sleep(5000);
        validator.setError(params.getProperty("name"), "test error")
//        setResult(OperationResult.finished("test message"))
    }
}
