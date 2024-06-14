show databases;
use risk_factors_by_vountry;
select * from no_of_death_by_risk_factor;

-- Analysing total deaths yearly due to particular reason on year from 1990 to 2019;
select Year, sum(High_systolic_blood_pressure), sum(Diet_high_in_sodium), sum(Diet_low_in_whole_grains), sum(Alcohol_use), sum(Diet_low_in_fruits), sum(Unsafe_water_source), sum(Secondhand_smoke), sum(Low_birth_weight), sum(Child_wasting), sum(Unsafe_sex), sum(Diet_low_in_nuts_and_seeds), sum(Household_air_pollution_from_solid_fuels), sum(Diet_low_in_vegetables), sum(Smoking), sum(High_fasting_plasma_glucose), sum(Air_pollution), sum(High_body_mass_index), sum(Unsafe_sanitation), sum(Drug_use), sum(Low_bone_mineral_density), sum(VitaminA_deficiency), sum(Child_stunting), sum(Non_exclusive_breastfeeding), sum(Iron_deficiency), sum(Ambient_particulate_matter_pollution), sum(Low_physical_activity), sum(No_handwashing_facility), sum(High_LDL_cholesterol)
from no_of_death_by_risk_factor
group by Year;

-- Analysing total deaths countrywise due to particular reason from 1990 to 2019;
select Entity, sum(High_systolic_blood_pressure), sum(Diet_high_in_sodium), sum(Diet_low_in_whole_grains), sum(Alcohol_use), sum(Diet_low_in_fruits), sum(Unsafe_water_source), sum(Secondhand_smoke), sum(Low_birth_weight), sum(Child_wasting), sum(Unsafe_sex), sum(Diet_low_in_nuts_and_seeds), sum(Household_air_pollution_from_solid_fuels), sum(Diet_low_in_vegetables), sum(Smoking), sum(High_fasting_plasma_glucose), sum(Air_pollution), sum(High_body_mass_index), sum(Unsafe_sanitation), sum(Drug_use), sum(Low_bone_mineral_density), sum(VitaminA_deficiency), sum(Child_stunting), sum(Non_exclusive_breastfeeding), sum(Iron_deficiency), sum(Ambient_particulate_matter_pollution), sum(Low_physical_activity), sum(No_handwashing_facility), sum(High_LDL_cholesterol)
from no_of_death_by_risk_factor
group by Entity;

-- Analysing deaths countrywise for a particular year;
WITH RiskFactorsSum AS (
    SELECT 
        Entity,
        Year,
        (High_systolic_blood_pressure +
         Diet_high_in_sodium +
         Diet_low_in_whole_grains +
         Alcohol_use +
         Diet_low_in_fruits +
         Unsafe_water_source +
         Secondhand_smoke +
         Low_birth_weight +
         Child_wasting +
         Unsafe_sex +
         Diet_low_in_nuts_and_seeds +
         Household_air_pollution_from_solid_fuels +
         Diet_low_in_vegetables +
         Smoking +
         High_fasting_plasma_glucose +
         Air_pollution +
         High_body_mass_index +
         Unsafe_sanitation +
         Drug_use +
         Low_bone_mineral_density +
         VitaminA_deficiency +
         Child_stunting +
         Non_exclusive_breastfeeding +
         Iron_deficiency +
         Ambient_particulate_matter_pollution +
         Low_physical_activity +
         No_handwashing_facility +
         High_LDL_cholesterol) AS total_sum
    FROM no_of_death_by_risk_factor
    WHERE Year = 2000
)
SELECT 
    n.Entity,
    n.Year,
    n.High_systolic_blood_pressure AS total_deaths_high_systolic_blood_pressure,
    n.Diet_high_in_sodium AS total_deaths_diet_high_in_sodium,
    n.Diet_low_in_whole_grains AS total_deaths_diet_low_in_whole_grains,
    n.Alcohol_use AS total_deaths_alcohol_use,
    n.Diet_low_in_fruits AS total_deaths_diet_low_in_fruits,
    n.Unsafe_water_source AS total_deaths_unsafe_water_source,
    n.Secondhand_smoke AS total_deaths_secondhand_smoke,
    n.Low_birth_weight AS total_deaths_low_birth_weight,
    n.Child_wasting AS total_deaths_child_wasting,
    n.Unsafe_sex AS total_deaths_unsafe_sex,
    n.Diet_low_in_nuts_and_seeds AS total_deaths_diet_low_in_nuts_and_seeds,
    n.Household_air_pollution_from_solid_fuels AS total_deaths_household_air_pollution,
    n.Diet_low_in_vegetables AS total_deaths_diet_low_in_vegetables,
    n.Smoking AS total_deaths_smoking,
    n.High_fasting_plasma_glucose AS total_deaths_high_fasting_plasma_glucose,
    n.Air_pollution AS total_deaths_air_pollution,
    n.High_body_mass_index AS total_deaths_high_body_mass_index,
    n.Unsafe_sanitation AS total_deaths_unsafe_sanitation,
    n.Drug_use AS total_deaths_drug_use,
    n.Low_bone_mineral_density AS total_deaths_low_bone_mineral_density,
    n.VitaminA_deficiency AS total_deaths_vitaminA_deficiency,
    n.Child_stunting AS total_deaths_child_stunting,
    n.Non_exclusive_breastfeeding AS total_deaths_non_exclusive_breastfeeding,
    n.Iron_deficiency AS total_deaths_iron_deficiency,
    n.Ambient_particulate_matter_pollution AS total_deaths_ambient_particulate_matter_pollution,
    n.Low_physical_activity AS total_deaths_low_physical_activity,
    n.No_handwashing_facility AS total_deaths_no_handwashing_facility,
    n.High_LDL_cholesterol AS total_deaths_high_LDL_cholesterol
FROM 
    no_of_death_by_risk_factor AS n
JOIN 
    RiskFactorsSum AS r
ON 
    n.Entity = r.Entity AND n.Year = r.Year
WHERE 
    n.Year = 2000;

-- Analysing deaths yearly for a particular country due to various reasons;
WITH RiskFactorsSum AS (
    SELECT 
        Entity,
        Year,
        (High_systolic_blood_pressure +
         Diet_high_in_sodium +
         Diet_low_in_whole_grains +
         Alcohol_use +
         Diet_low_in_fruits +
         Unsafe_water_source +
         Secondhand_smoke +
         Low_birth_weight +
         Child_wasting +
         Unsafe_sex +
         Diet_low_in_nuts_and_seeds +
         Household_air_pollution_from_solid_fuels +
         Diet_low_in_vegetables +
         Smoking +
         High_fasting_plasma_glucose +
         Air_pollution +
         High_body_mass_index +
         Unsafe_sanitation +
         Drug_use +
         Low_bone_mineral_density +
         VitaminA_deficiency +
         Child_stunting +
         Non_exclusive_breastfeeding +
         Iron_deficiency +
         Ambient_particulate_matter_pollution +
         Low_physical_activity +
         No_handwashing_facility +
         High_LDL_cholesterol) AS total_sum
    FROM no_of_death_by_risk_factor
    WHERE Entity = "India"
)
SELECT 
    n.Entity,
    n.Year,
    n.High_systolic_blood_pressure AS total_deaths_high_systolic_blood_pressure,
    n.Diet_high_in_sodium AS total_deaths_diet_high_in_sodium,
    n.Diet_low_in_whole_grains AS total_deaths_diet_low_in_whole_grains,
    n.Alcohol_use AS total_deaths_alcohol_use,
    n.Diet_low_in_fruits AS total_deaths_diet_low_in_fruits,
    n.Unsafe_water_source AS total_deaths_unsafe_water_source,
    n.Secondhand_smoke AS total_deaths_secondhand_smoke,
    n.Low_birth_weight AS total_deaths_low_birth_weight,
    n.Child_wasting AS total_deaths_child_wasting,
    n.Unsafe_sex AS total_deaths_unsafe_sex,
    n.Diet_low_in_nuts_and_seeds AS total_deaths_diet_low_in_nuts_and_seeds,
    n.Household_air_pollution_from_solid_fuels AS total_deaths_household_air_pollution,
    n.Diet_low_in_vegetables AS total_deaths_diet_low_in_vegetables,
    n.Smoking AS total_deaths_smoking,
    n.High_fasting_plasma_glucose AS total_deaths_high_fasting_plasma_glucose,
    n.Air_pollution AS total_deaths_air_pollution,
    n.High_body_mass_index AS total_deaths_high_body_mass_index,
    n.Unsafe_sanitation AS total_deaths_unsafe_sanitation,
    n.Drug_use AS total_deaths_drug_use,
    n.Low_bone_mineral_density AS total_deaths_low_bone_mineral_density,
    n.VitaminA_deficiency AS total_deaths_vitaminA_deficiency,
    n.Child_stunting AS total_deaths_child_stunting,
    n.Non_exclusive_breastfeeding AS total_deaths_non_exclusive_breastfeeding,
    n.Iron_deficiency AS total_deaths_iron_deficiency,
    n.Ambient_particulate_matter_pollution AS total_deaths_ambient_particulate_matter_pollution,
    n.Low_physical_activity AS total_deaths_low_physical_activity,
    n.No_handwashing_facility AS total_deaths_no_handwashing_facility,
    n.High_LDL_cholesterol AS total_deaths_high_LDL_cholesterol
FROM 
    no_of_death_by_risk_factor AS n
JOIN 
    RiskFactorsSum AS r
ON 
    n.Entity = r.Entity AND n.Year = r.Year
WHERE 
    n.Entity = "India";

-- Analysing death ratio of a particular country due to each reason from 1990 to 2019;
-- The particular country is chosen by Code
WITH RiskFactorsSum AS (
    SELECT 
        Entity, 
        Year,
        (High_systolic_blood_pressure + 
        Diet_high_in_sodium + 
        Diet_low_in_whole_grains + 
        Alcohol_use + 
        Diet_low_in_fruits + 
        Unsafe_water_source + 
        Secondhand_smoke + 
        Low_birth_weight + 
        Child_wasting + 
        Unsafe_sex + 
        Diet_low_in_nuts_and_seeds + 
        Household_air_pollution_from_solid_fuels + 
        Diet_low_in_vegetables + 
        Smoking + 
        High_fasting_plasma_glucose + 
        Air_pollution + 
        High_body_mass_index + 
        Unsafe_sanitation + 
        Drug_use + 
        Low_bone_mineral_density + 
        VitaminA_deficiency + 
        Child_stunting + 
        Non_exclusive_breastfeeding + 
        Iron_deficiency + 
        Ambient_particulate_matter_pollution + 
        Low_physical_activity + 
        No_handwashing_facility + 
        High_LDL_cholesterol) AS total_sum 
    FROM no_of_death_by_risk_factor
    WHERE Code = 'IND'
)
SELECT 
    n.Entity, 
    n.Year, 
    n.High_systolic_blood_pressure / r.total_sum AS ratio_high_systolic_blood_pressure,
    n.Diet_high_in_sodium / r.total_sum AS ratio_diet_high_in_sodium,
    n.Diet_low_in_whole_grains / r.total_sum AS ratio_diet_low_in_whole_grains,
    n.Alcohol_use / r.total_sum AS ratio_alcohol_use,
    n.Diet_low_in_fruits / r.total_sum AS ratio_diet_low_in_fruits,
    n.Unsafe_water_source / r.total_sum AS ratio_unsafe_water_source,
    n.Secondhand_smoke / r.total_sum AS ratio_secondhand_smoke,
    n.Low_birth_weight / r.total_sum AS ratio_low_birth_weight,
    n.Child_wasting / r.total_sum AS ratio_child_wasting,
    n.Unsafe_sex / r.total_sum AS ratio_unsafe_sex,
    n.Diet_low_in_nuts_and_seeds / r.total_sum AS ratio_diet_low_in_nuts_and_seeds,
    n.Household_air_pollution_from_solid_fuels / r.total_sum AS ratio_household_air_pollution,
    n.Diet_low_in_vegetables / r.total_sum AS ratio_diet_low_in_vegetables,
    n.Smoking / r.total_sum AS ratio_smoking,
    n.High_fasting_plasma_glucose / r.total_sum AS ratio_high_fasting_plasma_glucose,
    n.Air_pollution / r.total_sum AS ratio_air_pollution,
    n.High_body_mass_index / r.total_sum AS ratio_high_body_mass_index,
    n.Unsafe_sanitation / r.total_sum AS ratio_unsafe_sanitation,
    n.Drug_use / r.total_sum AS ratio_drug_use,
    n.Low_bone_mineral_density / r.total_sum AS ratio_low_bone_mineral_density,
    n.VitaminA_deficiency / r.total_sum AS ratio_vitaminA_deficiency,
    n.Child_stunting / r.total_sum AS ratio_child_stunting,
    n.Non_exclusive_breastfeeding / r.total_sum AS ratio_non_exclusive_breastfeeding,
    n.Iron_deficiency / r.total_sum AS ratio_iron_deficiency,
    n.Ambient_particulate_matter_pollution / r.total_sum AS ratio_ambient_particulate_matter_pollution,
    n.Low_physical_activity / r.total_sum AS ratio_low_physical_activity,
    n.No_handwashing_facility / r.total_sum AS ratio_no_handwashing_facility,
    n.High_LDL_cholesterol / r.total_sum AS ratio_high_LDL_cholesterol
    
FROM 
    no_of_death_by_risk_factor AS n
JOIN 
    RiskFactorsSum AS r
ON 
    n.Entity = r.Entity AND n.Year = r.Year
WHERE 
    n.Code = 'IND';

-- Analysing death ratio in a particular year of each country;
-- The particular Year is chosen by Input Year
WITH RiskFactorsSum AS (
    SELECT 
        Entity, 
        Year,
        (High_systolic_blood_pressure + 
        Diet_high_in_sodium + 
        Diet_low_in_whole_grains + 
        Alcohol_use + 
        Diet_low_in_fruits + 
        Unsafe_water_source + 
        Secondhand_smoke + 
        Low_birth_weight + 
        Child_wasting + 
        Unsafe_sex + 
        Diet_low_in_nuts_and_seeds + 
        Household_air_pollution_from_solid_fuels + 
        Diet_low_in_vegetables + 
        Smoking + 
        High_fasting_plasma_glucose + 
        Air_pollution + 
        High_body_mass_index + 
        Unsafe_sanitation + 
        Drug_use + 
        Low_bone_mineral_density + 
        VitaminA_deficiency + 
        Child_stunting + 
        Non_exclusive_breastfeeding + 
        Iron_deficiency + 
        Ambient_particulate_matter_pollution + 
        Low_physical_activity + 
        No_handwashing_facility + 
        High_LDL_cholesterol) AS total_sum 
    FROM no_of_death_by_risk_factor
    WHERE Year = 2000
)
SELECT 
    n.Entity, 
    n.Year, 
    n.High_systolic_blood_pressure / r.total_sum AS ratio_high_systolic_blood_pressure,
    n.Diet_high_in_sodium / r.total_sum AS ratio_diet_high_in_sodium,
    n.Diet_low_in_whole_grains / r.total_sum AS ratio_diet_low_in_whole_grains,
    n.Alcohol_use / r.total_sum AS ratio_alcohol_use,
    n.Diet_low_in_fruits / r.total_sum AS ratio_diet_low_in_fruits,
    n.Unsafe_water_source / r.total_sum AS ratio_unsafe_water_source,
    n.Secondhand_smoke / r.total_sum AS ratio_secondhand_smoke,
    n.Low_birth_weight / r.total_sum AS ratio_low_birth_weight,
    n.Child_wasting / r.total_sum AS ratio_child_wasting,
    n.Unsafe_sex / r.total_sum AS ratio_unsafe_sex,
    n.Diet_low_in_nuts_and_seeds / r.total_sum AS ratio_diet_low_in_nuts_and_seeds,
    n.Household_air_pollution_from_solid_fuels / r.total_sum AS ratio_household_air_pollution,
    n.Diet_low_in_vegetables / r.total_sum AS ratio_diet_low_in_vegetables,
    n.Smoking / r.total_sum AS ratio_smoking,
    n.High_fasting_plasma_glucose / r.total_sum AS ratio_high_fasting_plasma_glucose,
    n.Air_pollution / r.total_sum AS ratio_air_pollution,
    n.High_body_mass_index / r.total_sum AS ratio_high_body_mass_index,
    n.Unsafe_sanitation / r.total_sum AS ratio_unsafe_sanitation,
    n.Drug_use / r.total_sum AS ratio_drug_use,
    n.Low_bone_mineral_density / r.total_sum AS ratio_low_bone_mineral_density,
    n.VitaminA_deficiency / r.total_sum AS ratio_vitaminA_deficiency,
    n.Child_stunting / r.total_sum AS ratio_child_stunting,
    n.Non_exclusive_breastfeeding / r.total_sum AS ratio_non_exclusive_breastfeeding,
    n.Iron_deficiency / r.total_sum AS ratio_iron_deficiency,
    n.Ambient_particulate_matter_pollution / r.total_sum AS ratio_ambient_particulate_matter_pollution,
    n.Low_physical_activity / r.total_sum AS ratio_low_physical_activity,
    n.No_handwashing_facility / r.total_sum AS ratio_no_handwashing_facility,
    n.High_LDL_cholesterol / r.total_sum AS ratio_high_LDL_cholesterol
    
FROM 
    no_of_death_by_risk_factor AS n
JOIN 
    RiskFactorsSum AS r
ON 
    n.Entity = r.Entity AND n.Year = r.Year
WHERE 
    n.Year = 2000;

-- Obtaining particular year for particular risk reasos for every country
WITH RiskFactorsSum AS (
  SELECT
    Entity,
    Year,
    (High_systolic_blood_pressure + Diet_high_in_sodium + Diet_low_in_whole_grains + Alcohol_use + Diet_low_in_fruits + Unsafe_water_source + Secondhand_smoke + Low_birth_weight + Child_wasting + Unsafe_sex + Diet_low_in_nuts_and_seeds + Household_air_pollution_from_solid_fuels + Diet_low_in_vegetables + Smoking + High_fasting_plasma_glucose + Air_pollution + High_body_mass_index + Unsafe_sanitation + Drug_use + Low_bone_mineral_density + VitaminA_deficiency + Child_stunting + Non_exclusive_breastfeeding + Iron_deficiency + Ambient_particulate_matter_pollution + Low_physical_activity + No_handwashing_facility + High_LDL_cholesterol) AS total_sum
  FROM
    no_of_death_by_risk_factor
)
SELECT
  Entity,
  Year,
  Code,
  (High_systolic_blood_pressure / total_sum) AS High_systolic_blood_pressure_ratio
FROM
  no_of_death_by_risk_factor n
  JOIN RiskFactorsSum r USING (Entity, Year)
WHERE
  n.Year = 2000;
  
-- Obtaining particular country for particular risk reasos for every year
WITH RiskFactorsSum AS (
  SELECT
    Entity,
    Year,
    (High_systolic_blood_pressure + Diet_high_in_sodium + Diet_low_in_whole_grains + Alcohol_use + Diet_low_in_fruits + Unsafe_water_source + Secondhand_smoke + Low_birth_weight + Child_wasting + Unsafe_sex + Diet_low_in_nuts_and_seeds + Household_air_pollution_from_solid_fuels + Diet_low_in_vegetables + Smoking + High_fasting_plasma_glucose + Air_pollution + High_body_mass_index + Unsafe_sanitation + Drug_use + Low_bone_mineral_density + VitaminA_deficiency + Child_stunting + Non_exclusive_breastfeeding + Iron_deficiency + Ambient_particulate_matter_pollution + Low_physical_activity + No_handwashing_facility + High_LDL_cholesterol) AS total_sum
  FROM
    no_of_death_by_risk_factor
)
SELECT
  Entity,
  Year,
  Code,
  (High_systolic_blood_pressure / total_sum) AS High_systolic_blood_pressure_ratio
FROM
  no_of_death_by_risk_factor n
  JOIN RiskFactorsSum r USING (Entity, Year)
WHERE
  n.Code = "IND";