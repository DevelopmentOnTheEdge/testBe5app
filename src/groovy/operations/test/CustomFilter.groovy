package test

import com.developmentontheedge.be5.model.GDynamicPropertySetSupport
import com.developmentontheedge.be5.databasemodel.util.DpsUtils
import com.developmentontheedge.be5.server.operations.FilterOperation
import com.developmentontheedge.beans.DynamicPropertySet

class CustomFilter extends FilterOperation
{
    @Override
    DynamicPropertySet getFilterParameters(Map<String, Object> presetValues) throws Exception
    {
        def params = new GDynamicPropertySetSupport()
        params.add {
            name = "ID"
            TYPE = Integer
            TAG_LIST_ATTR = queries.getTagsFromSelectionView(getInfo().getEntityName())
            MULTIPLE_SELECTION_LIST = true
            CAN_BE_NULL = true
        }
        return DpsUtils.setValues(params, presetValues)
    }
}
