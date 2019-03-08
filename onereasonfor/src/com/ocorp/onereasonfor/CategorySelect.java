package com.ocorp.onereasonfor;

import java.util.ArrayList;
import java.util.List;

import org.apache.click.control.Option;
import org.apache.click.control.OptionGroup;
import org.apache.click.control.Select;

public class CategorySelect extends Select {

    public CategorySelect(String label) {
        super(label);
        List options = new ArrayList();
        OptionGroup property = new OptionGroup("Entreteriment");
        property.add(new Option("Movies", "Movies"));
        property.add(new Option("Music", "Music"));
        options.add(property);

        OptionGroup securities = new OptionGroup("Technologies");
        securities.add(new Option("Java"));
        securities.add(new Option("SQL"));
        securities.add(new Option("Other"));
        options.add(securities);
        setOptionList(options);
    }
}
