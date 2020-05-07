package operations.test

import com.developmentontheedge.be5.databasemodel.util.DpsUtils
import com.developmentontheedge.be5.operation.Operation
import com.developmentontheedge.be5.server.operations.support.GOperationSupport
import com.developmentontheedge.be5.util.DateUtils
import com.developmentontheedge.beans.DynamicPropertySet
import groovy.transform.TypeChecked

@TypeChecked
class TestTabedOperation extends GOperationSupport implements Operation {
    @Override
    Object getParameters(Map<String, Object> presetValues) throws Exception {
        params.add {
            name = "prop1"; DISPLAY_NAME = "Property 1"; TYPE = Integer;
            TAG_LIST_ATTR = [1, 2, 3] as Integer[]; value = 2
        }

        params.add {
            TAB_ID = "1"; TAB_NAME = "first"; name = "prop2"; DISPLAY_NAME = "Property 2";
            value = "val21"
        }
        params.add {
            TAB_ID = "1"; TAB_NAME = "first"; name = "prop3"; DISPLAY_NAME = "Property 3";
            value = "val31"
        }
        params.add {
            TAB_ID = "2"; TAB_NAME = "second"; name = "prop4"; DISPLAY_NAME = "Property 4";
            value = "val42"
        }
        params.add {
            TAB_ID = "1"; TAB_NAME = "first"; name = "prop5"; DISPLAY_NAME = "Property 5";
            value = "val51"
        }

        params.add {
            name = "prop6"; DISPLAY_NAME = "Property 6"; value = DateUtils.currentDate()
        }

        return DpsUtils.setValues(params, presetValues)
    }

    @Override
    void invoke(Object parameters) throws Exception {
        setResultFinished(((DynamicPropertySet) parameters).asMap().toString())
    }
}
