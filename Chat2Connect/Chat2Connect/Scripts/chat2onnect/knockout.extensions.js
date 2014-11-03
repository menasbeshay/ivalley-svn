ko.observableArray.fn.filterByProperty = function (propName, matchValue) {
    return ko.pureComputed(function () {
        var allItems = this(), matchingItems = [];
        for (var i = 0; i < allItems.length; i++) {
            var current = allItems[i];
            if (ko.unwrap(current[propName]) === matchValue)
                matchingItems.push(current);
        }
        return matchingItems;
    }, this);
}

ko.onDemandObservable = function (callback, target) {
    var _value = ko.observable();  //private observable

    var result = ko.dependentObservable({
        read: function () {
            //if it has not been loaded, execute the supplied function
            if (!result.loaded()) {
                callback.call(target);
            }
            //always return the current value
            return _value();
        },
        write: function (newValue) {
            //indicate that the value is now loaded and set it
            result.loaded(true);
            _value(newValue);
        },
        deferEvaluation: true  //do not evaluate immediately when created
    });

    //expose the current state, which can be bound against
    result.loaded = ko.observable();
    //load it again
    result.refresh = function () {
        result.loaded(false);
    };

    return result;
};
ko.bindingHandlers.slideVisible = {
    init: function (element, valueAccessor) {
        var value = valueAccessor();
        $(element).toggle(ko.unwrap(value));
    },
    update: function (element, valueAccessor) {
        var value = valueAccessor();
        ko.unwrap(value) ? $(element).slideDown(700) : $(element).slideUp(700);
    }
};

ko.bindingHandlers.date = {
    update: function (element, valueAccessor, allBindingsAccessor, viewModel) {
        var value = valueAccessor();
        var allBindings = allBindingsAccessor();
        var valueUnwrapped = ko.utils.unwrapObservable(value);
        var pattern = allBindings.format || 'DD/MM/YYYY';
        var output = "-";
        if (valueUnwrapped !== null && valueUnwrapped !== undefined && valueUnwrapped.length > 0) {
            output = moment(valueUnwrapped).format(pattern);
        }

        if ($(element).is("input") === true) {
            $(element).val(output);
        } else {
            $(element).text(output);
        }
    }
};

ko.bindingHandlers.rate = {
    update: function (element, valueAccessor, allBindingsAccessor, viewModel) {
        var value = ko.utils.unwrapObservable(valueAccessor());
        if (value == null || value == undefined) {
            value = 0;
        }
        var rateString = "";
        for (var i = 0; i < 5; i++)
        {
            if (i < value)
                rateString += "<i class='icon icon-star GoldRate'></i>";
            else
                rateString += "<i class='icon icon-star-empty GoldRate'></i>";
        }
        $(element).html(rateString);
    }
};