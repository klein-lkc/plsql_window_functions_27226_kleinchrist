// 1.Rank treatments by cost within each medical specialty
SELECT 
    ms.speciality,
    t.treatment_id,
    t.diagnostic,
    t.cost_treatment,
    RANK() OVER (PARTITION BY ms.speciality ORDER BY t.cost_treatment DESC) AS rank_in_speciality
FROM treatment t
INNER JOIN medical_staff ms 
    ON t.staff_id = ms.staff_id;

// 2. Total cumulative processing costs over time
SELECT 
    t.treatment_id,
    t.date_treatment,
    t.cost_treatment,
    SUM(t.cost_treatment) OVER (
        ORDER BY t.date_treatment
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM treatment t
ORDER BY t.date_treatment;

// 3. Analyze the cost variation between the current and previous treatment for each patient.
  SELECT 
    t.patient_id,
    t.treatment_id,
    t.date_treatment,
    t.cost_treatment,
    LAG(t.cost_treatment) OVER (
        PARTITION BY t.patient_id 
        ORDER BY t.date_treatment
    ) AS previous_cost,
    (t.cost_treatment - LAG(t.cost_treatment) OVER (
        PARTITION BY t.patient_id 
        ORDER BY t.date_treatment
    )) AS cost_variation
FROM treatment t
ORDER BY t.patient_id, t.date_treatment;

// 4. Segment treatment costs into quartiles (Low, Medium, High, Very High).
SELECT 
    t.treatment_id,
    t.diagnostic,
    t.cost_treatment,
    NTILE(4) OVER (ORDER BY t.cost_treatment) AS quartile
FROM treatment t
ORDER BY t.cost_treatment;


