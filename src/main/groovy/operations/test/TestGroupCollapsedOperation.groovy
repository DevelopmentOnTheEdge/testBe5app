package operations.test

import com.developmentontheedge.be5.databasemodel.util.DpsUtils
import com.developmentontheedge.be5.operation.Operation
import com.developmentontheedge.be5.server.operations.support.GOperationSupport
import groovy.transform.TypeChecked

@TypeChecked
class TestGroupCollapsedOperation extends GOperationSupport implements Operation {

    @Override
    Object getParameters(Map<String, Object> presetValues) throws Exception
    {
        params.add { TYPE = String; name = "prop1"; DISPLAY_NAME = "Property 1"; GROUP_ID = 1; GROUP_NAME = "Group 1"}
        params.add { TYPE = String; name = "prop2"; DISPLAY_NAME = "Property 2"; GROUP_ID = 1; GROUP_NAME = "Group 1"}
        params.add { TYPE = String; name = "prop3"; DISPLAY_NAME = "Property 3"; GROUP_ID = 2; GROUP_NAME = "Group 2"}
        params.add { TYPE = String; name = "prop4"; DISPLAY_NAME = "Property 4"; GROUP_ID = 2; GROUP_NAME = "Group 2"}
        params.add { TYPE = String; name = "prop5"; DISPLAY_NAME = "Property 5"; GROUP_ID = 2; GROUP_NAME = "Group 2"}
        params.add { TYPE = String; name = "prop5"; DISPLAY_NAME = "Property 6"; GROUP_ID = 3; GROUP_NAME = "Group 3"}

        return DpsUtils.setValues(params, presetValues)

    }

    @Override
    void invoke(Object parameters) throws Exception
    {

    }
}
