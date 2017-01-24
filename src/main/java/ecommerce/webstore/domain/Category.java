package ecommerce.webstore.domain;

public enum Category {

	VEGETABLE("Vegetable"),
    FRUIT("Fruit");
    private final String selectedValue;


    private Category(String selectedValue) {
        this.selectedValue = selectedValue;
    }

    public String getSelectedValue() {
        return selectedValue;
    }



}	
