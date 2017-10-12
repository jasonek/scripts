SELECT `ID`, `CompanyName`, `Priority` , convo.total_minutes
FROM `testdbname`.`tblCustomerCompanies` as companies
JOIN (
	SELECT SUM(minutes) as total_minutes, `companyID`
	FROM `testdbname`.`tblCustomerConversation`
	WHERE `minutes` IS NOT NULL
	AND year(`date`) = '2015'
	GROUP BY `companyID`
) convo ON convo.companyID = companies.ID
