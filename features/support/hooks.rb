World(Helper)

After do |scenario|
  scenario_name = scenario.name.gsub!(/\s+/, "_")
  scenario_name = scenario.name.delete(",", "")
  scenario_name = scenario.name.delete("(", "")
  scenario_name = scenario.name.delete(")", "")
  scenario_name = scenario.name.delete("#", "")

  if scenario.failed?
    urlSLCEF = page.current_url
    titulePagina = page.title

    $logger.info("Capturando screenshot de falha ocorrida em:" + " " + titulePagina + "-" + urlSLCEF)
    take_screenshot(scenario_name.downcase!, "failed")
  else
    $logger.info("Capturando screenshot do sucesso")
    take_screenshot(scenario_name.downcase!, "passed")
  end
end
