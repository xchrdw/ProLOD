package prolod.preprocessing

import com.typesafe.scalalogging.LazyLogging
import graphlod.GraphLOD
import graphlod.dataset.Dataset
import prolod.common.config.DatabaseConnection

class GraphLodSatelliteComponentAnalysis(var db: DatabaseConnection, var name : String, var dataset: Dataset) extends LazyLogging {
	//val excludedNamespaces : List[String] = Nil
	val sateliteComponents : graphlod.SatelliteComponentAnalysis = new graphlod.SatelliteComponentAnalysis(name, dataset)

	def run: Unit = {
		val graphLodInstance: GraphLOD = sateliteComponents.getGraphLodInstance
		logger.info("Insert patterns into DB")
		db.insertPatterns(name, graphLodInstance.patterns, graphLodInstance.coloredPatterns, graphLodInstance.colorIsomorphicPatterns, graphLodInstance.patternDiameter, None)
	}
}
