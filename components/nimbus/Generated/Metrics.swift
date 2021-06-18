// -*- mode: Swift -*-

// AUTOGENERATED BY glean_parser. DO NOT EDIT. DO NOT COMMIT.

/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

// swiftlint:disable superfluous_disable_command
// swiftlint:disable nesting
// swiftlint:disable line_length
// swiftlint:disable identifier_name
// swiftlint:disable force_try

import Glean

extension GleanMetrics {
    enum NimbusEvents {
        enum EnrollmentKeys: Int32, ExtraKeys {
            case branch = 0
            case enrollmentId = 1
            case experiment = 2

            public func index() -> Int32 {
                return self.rawValue
            }
        }

        enum UnenrollmentKeys: Int32, ExtraKeys {
            case branch = 0
            case enrollmentId = 1
            case experiment = 2

            public func index() -> Int32 {
                return self.rawValue
            }
        }

        enum DisqualificationKeys: Int32, ExtraKeys {
            case branch = 0
            case enrollmentId = 1
            case experiment = 2

            public func index() -> Int32 {
                return self.rawValue
            }
        }

        enum ExposureKeys: Int32, ExtraKeys {
            case branch = 0
            case enrollmentId = 1
            case experiment = 2

            public func index() -> Int32 {
                return self.rawValue
            }
        }

        /// Recorded when a user has met the conditions and is first bucketed into an
        /// experiment (i.e. targeting matched and they were randomized into a bucket and
        /// branch of the experiment). Expected a maximum of once per experiment per user.
        static let enrollment = EventMetricType<EnrollmentKeys>( // generated from nimbus_events.enrollment
            category: "nimbus_events",
            name: "enrollment",
            sendInPings: ["events"],
            lifetime: .ping,
            disabled: false,
            allowedExtraKeys: ["branch", "enrollment_id", "experiment"]
        )

        /// Recorded when either telemetry is disabled, or the experiment has run for its
        /// designed duration (i.e. it is no longer present in the Nimbus Remote Settings
        /// collection)
        static let unenrollment = EventMetricType<UnenrollmentKeys>( // generated from nimbus_events.unenrollment
            category: "nimbus_events",
            name: "unenrollment",
            sendInPings: ["events"],
            lifetime: .ping,
            disabled: false,
            allowedExtraKeys: ["branch", "enrollment_id", "experiment"]
        )

        /// Recorded when a user becomes ineligible to continue receiving the treatment for
        /// an enrolled experiment, for reasons such as the user opting out of the
        /// experiment or no longer matching targeting for the experiment.
        static let disqualification = EventMetricType<DisqualificationKeys>( // generated from nimbus_events.disqualification
            category: "nimbus_events",
            name: "disqualification",
            sendInPings: ["events"],
            lifetime: .ping,
            disabled: false,
            allowedExtraKeys: ["branch", "enrollment_id", "experiment"]
        )

        /// Recorded when a user actually observes an experimental treatment, or would have
        /// observed an experimental treatment if they had been in a branch that would have
        /// shown one.
        static let exposure = EventMetricType<ExposureKeys>( // generated from nimbus_events.exposure
            category: "nimbus_events",
            name: "exposure",
            sendInPings: ["events"],
            lifetime: .ping,
            disabled: false,
            allowedExtraKeys: ["branch", "enrollment_id", "experiment"]
        )

    }

}