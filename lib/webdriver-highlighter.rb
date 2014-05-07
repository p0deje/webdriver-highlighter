require 'selenium-webdriver'


class WebDriverHighlighter < Selenium::WebDriver::Support::AbstractEventListener

  def before_click(element, driver)
    flash(element, driver)
  end

  def before_change_value_of(element, driver)
    flash(element, driver)
  end

  private

  #
  # Changes background color of element for a moment.
  #
  # @api private
  #

  def flash(element, driver)
    css_text = element.style('cssText')
    driver.execute_script('arguments[0].style.cssText += "; background: magenta; outline: 1px solid magenta"', element)
    snippet = <<-JS
      var element = arguments[0], cssText = arguments[1], done = arguments[2];
      setTimeout(function() {
        element.style.cssText = cssText;
        done();
      }, 100)
    JS
    # TODO make sure we rollback to user-defined timeout
    # blocked by https://code.google.com/p/selenium/issues/detail?id=6608
    driver.manage.timeouts.script_timeout = 1
    driver.execute_async_script(snippet, element, css_text)
  end

end # WebDriverHighlighter
