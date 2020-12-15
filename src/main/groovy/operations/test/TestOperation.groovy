package operations.test

import com.developmentontheedge.be5.databasemodel.util.DpsUtils
import com.developmentontheedge.be5.operation.Operation
import com.developmentontheedge.be5.operation.OperationResult
import com.developmentontheedge.be5.server.operations.support.GOperationSupport
import groovy.transform.TypeChecked

@TypeChecked
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
        }

        params.add {
            name = "tags"
            TAG_LIST_ATTR = [["1","первый таг"],["2","второй таг"],["3","третий таг"]] as String[][]
            MULTIPLE_SELECTION_LIST = true
            CAN_BE_NULL = true
        }

        params.add {
            name = "async"
            TAG_LIST_ATTR = queries.getTagsFromSelectionView("testtable")
            MULTIPLE_SELECTION_LIST = true
            CAN_BE_NULL = true
            EXTRA_ATTRS = ["inputType": "AsyncSelect","entity": "testtable"]
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
